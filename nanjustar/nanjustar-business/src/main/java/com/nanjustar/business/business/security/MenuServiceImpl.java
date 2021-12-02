package com.nanjustar.business.business.security;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.security.api.MenuService;
import com.nanjustar.api.moudle.security.dto.ConsumerDetailDto;
import com.nanjustar.api.moudle.security.dto.MenuBackDto;
import com.nanjustar.api.moudle.security.dto.MenuRouterDto;
import com.nanjustar.api.moudle.security.entity.ConsumerRole;
import com.nanjustar.api.moudle.security.entity.Menu;
import com.nanjustar.api.moudle.security.entity.MenuRole;
import com.nanjustar.api.moudle.security.vo.MenuConditionVo;
import com.nanjustar.api.moudle.security.vo.MenuVo;
import com.nanjustar.mapper.utils.ConsumerUtil;
import com.nanjustar.common.constant.CommonConst;
import com.nanjustar.common.constant.RedisConst;
import com.nanjustar.common.constant.ServiceErrorConst;
import com.nanjustar.common.core.redis.RedisCache;
import com.nanjustar.common.exception.NanjustarException;
import com.nanjustar.common.utils.AssertUtil;
import com.nanjustar.common.utils.BeanCopyUtil;
import com.nanjustar.mapper.mapper.security.ConsumerRoleMapper;
import com.nanjustar.mapper.mapper.security.MenuMapper;
import com.nanjustar.mapper.mapper.security.MenuRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private RedisCache redisCache;
    @Autowired
    private ConsumerRoleMapper consumerRoleMapper;
    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Override
    public List<MenuRouterDto> listMenuRouter() {
        /*------------------------  查询当前用户菜单信息开始  -----------------------------*/
        List<Integer> roleIds = listConsumerRoleIds();
        List<Integer> menuIds = listRoleMenuIds(roleIds);
        /*------------------------  查询当前用户菜单信息完成  -----------------------------*/
        /*------------------------  查询父级菜单路由信息开始  -----------------------------*/
        List<Menu> menus = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, CommonConst.MENU_LAYOUT_ID)
                .eq(Menu::getIsHidden, CommonConst.NOT_HIDDEN)
                .eq(Menu::getIsDisable, CommonConst.NOT_DISABLE)
                .eq(Menu::getDelFlag, CommonConst.NOT_DELETE)
                .in(Menu::getMenuId, menuIds)
                .orderByAsc(Menu::getOrderNum));
        /*------------------------  查询父级菜单路由信息完成  -----------------------------*/
        /*------------------------  查询子级菜单路由信息完成  -----------------------------*/
        List<MenuRouterDto> menuRouterDtos = new ArrayList<>();
        menus.forEach(menu -> {
            MenuRouterDto menuRouterDto = BeanCopyUtil.copyObject(menu, MenuRouterDto.class);
            List<Menu> childrenMenu = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                    .eq(Menu::getParentId, menu.getMenuId())
                    .eq(Menu::getIsHidden, CommonConst.NOT_HIDDEN)
                    .eq(Menu::getIsDisable, CommonConst.NOT_DISABLE)
                    .eq(Menu::getDelFlag, CommonConst.NOT_DELETE)
                    .in(Menu::getMenuId, menuIds)
                    .orderByAsc(Menu::getOrderNum));
            menuRouterDto.setChildren(BeanCopyUtil.copyList(childrenMenu, MenuRouterDto.class));
            menuRouterDtos.add(menuRouterDto);
        });
        /*------------------------  查询子级菜单路由信息完成  -----------------------------*/
        return menuRouterDtos;
    }

    @Override
    public List<MenuBackDto> listChildrenMenuById(Integer id) {
        /*------------------------  查询子菜单信息开始  -----------------------------*/
        List<Menu> childrenMenu = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, id)
                .eq(Menu::getDelFlag, CommonConst.NOT_DELETE));
        List<MenuBackDto> list = new ArrayList<>();
        childrenMenu.forEach(children -> {
            MenuBackDto menuBackDto = BeanCopyUtil.copyObject(children, MenuBackDto.class);
            menuBackDto.setHasChildren(false);
            list.add(menuBackDto);
        });
        /*------------------------  查询子菜单信息完成  -----------------------------*/
        return list;
    }


    @Override
    public List<MenuBackDto> listParentMenu() {
        /*------------------------  开始查询父级菜单信息  -----------------------------*/
        List<Menu> menus = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, CommonConst.MENU_LAYOUT_ID)
                .eq(Menu::getDelFlag, CommonConst.NOT_DELETE)
                .orderByAsc(Menu::getOrderNum));
        /*------------------------  查询父级菜单信息完成  -----------------------------*/
        /*------------------------  检测父级菜单是否含有子菜单开始  -----------------------------*/
        List<MenuBackDto> parentMenu = BeanCopyUtil.copyList(menus, MenuBackDto.class);
        parentMenu.forEach(parent -> parent.setHasChildren(checkMenuIsHasChildren(parent.getMenuId())));
        /*------------------------  检测父级菜单是否含有子菜单完成  -----------------------------*/
        return parentMenu;
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @Override
    public void saveMenu(MenuVo menuVo) {
        /*------------------------  开始查重菜单信息是否存在  -----------------------------*/
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getMenuName, menuVo.getMenuName())
                .eq(Menu::getPath, menuVo.getPath())
                .eq(Menu::getParentId, menuVo.getParentId()));
        AssertUtil.sysIsError(count > 0, ServiceErrorConst.DATA_ALREADY_EXISTS);
        /*------------------------  查重菜单信息是否存在完成  -----------------------------*/
        /*------------------------  开始新增菜单信息  -----------------------------*/
        int insert = baseMapper.insert(BeanCopyUtil.copyObject(menuVo, Menu.class));
        AssertUtil.sysIsError(insert == 0, ServiceErrorConst.SAVE_DATA_FAIL);
        /*------------------------  新增菜单信息完成  -----------------------------*/
        /*------------------------  更新菜单角色关联表信息  -----------------------------*/
        Menu menu = baseMapper.selectOne(new LambdaQueryWrapper<Menu>().eq(Menu::getMenuName, menuVo.getMenuName()));
        int menuRoleInsert = menuRoleMapper.insert(new MenuRole(menu.getMenuId(), 1));
        AssertUtil.sysIsError(menuRoleInsert == 0, ServiceErrorConst.SAVE_DATA_FAIL);
        /*------------------------  更新菜单角色关联表信息  -----------------------------*/
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @Override
    public void updateMenu(MenuVo menuVo) {
        /*------------------------  开始查重菜单信息是否存在  -----------------------------*/
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getMenuName, menuVo.getMenuName())
                .eq(Menu::getPath, menuVo.getPath())
                .eq(Menu::getParentId, menuVo.getParentId()));
        AssertUtil.sysIsError(count > 1, ServiceErrorConst.DATA_ALREADY_EXISTS);
        /*------------------------  查重菜单信息是否存在完成  -----------------------------*/
        /*------------------------  修改新增菜单信息  -----------------------------*/
        int update = baseMapper.updateById(BeanCopyUtil.copyObject(menuVo, Menu.class));
        AssertUtil.sysIsError(update == 0, ServiceErrorConst.UPDATE_DATA_FAIL);
        /*------------------------  修改菜单信息完成  -----------------------------*/
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @Override
    public void deleteMenu(Integer id) {
        /*------------------------  检测子级菜单信息开始  -----------------------------*/
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, id)
                .eq(Menu::getDelFlag, CommonConst.NOT_DELETE));
        if (count > 0) {
            throw new NanjustarException(ServiceErrorConst.EXISTS_CHILD_ELEMENT);
        }
        /*------------------------  检测子级菜单信息完成  -----------------------------*/
        /*------------------------  开始删除菜单信息  -----------------------------*/
        int delete = baseMapper.deleteById(id);
        AssertUtil.sysIsError(delete == 0, ServiceErrorConst.DELETE_DATA_FAIL);
        /*------------------------  删除菜单信息完成  -----------------------------*/
        /*------------------------  删除菜单角色对应信息  -----------------------------*/
        int menuRoleDelete = menuRoleMapper.delete(new LambdaQueryWrapper<MenuRole>()
                .eq(MenuRole::getMenuId, id));
        AssertUtil.sysIsError(menuRoleDelete == 0, ServiceErrorConst.DELETE_DATA_FAIL);
        /*------------------------  删除菜单角色对应信息  -----------------------------*/
    }

    @Override
    public List<MenuBackDto> listMenuByCondition(MenuConditionVo menuConditionVo) {
        /*------------------------  开始查询菜单信息  -----------------------------*/
        List<Menu> menus = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .like(AssertUtil.isNotEmpty(menuConditionVo.getMenuName()), Menu::getMenuName, menuConditionVo.getMenuName())
                .eq(AssertUtil.isNotNull(menuConditionVo.getIsDisable()), Menu::getIsDisable, menuConditionVo.getIsDisable()));
        /*------------------------  查询菜单信息完成  -----------------------------*/
        /*------------------------  数据转化开始  -----------------------------*/
        List<MenuBackDto> list = new ArrayList<>();
        menus.forEach(menu -> {
            MenuBackDto menuBackDto = BeanCopyUtil.copyObject(menu, MenuBackDto.class);
            menuBackDto.setHasChildren(false);
            list.add(menuBackDto);
        });
        /*------------------------  数据转化完成  -----------------------------*/
        return list;
    }

    /**
     * 获取当前登陆用户的角色id集合
     *
     * @return 角色id集合
     */
    private List<Integer> listConsumerRoleIds() {
        /*------------------------  获取当前用户角色信息开始  -----------------------------*/
        ConsumerDetailDto consumer = ConsumerUtil.getUserDetails();
        return consumerRoleMapper.selectList(new LambdaQueryWrapper<ConsumerRole>()
                        .eq(ConsumerRole::getConsumerId, consumer.getUserId()))
                .stream()
                .map(ConsumerRole::getRoleId)
                .collect(Collectors.toList());
        /*------------------------  获取当前用户角色信息完成  -----------------------------*/
    }

    /**
     * 根据角色ids获取菜单ids
     *
     * @param roleIds 角色ids
     * @return 菜单ids
     */
    private List<Integer> listRoleMenuIds(List<Integer> roleIds) {
        return menuRoleMapper.selectList(new LambdaQueryWrapper<MenuRole>()
                        .in(MenuRole::getRoleId, roleIds))
                .stream()
                .map(MenuRole::getMenuId)
                .collect(Collectors.toList());
    }

    /**
     * 检查菜单是否含有子菜单
     *
     * @param id 菜单id
     * @return true 含有 false 不含有
     */
    private Boolean checkMenuIsHasChildren(Integer id) {
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, id)
                .eq(Menu::getIsHidden, CommonConst.NOT_HIDDEN)
                .eq(Menu::getIsDisable, CommonConst.NOT_DISABLE)
                .eq(Menu::getDelFlag, CommonConst.NOT_DELETE));
        return AssertUtil.isNumberNotZero(count);
    }


    /**
     * 查询redis中是否含有菜单路由
     *
     * @return true 含有    false 不含有
     */
    public List<MenuRouterDto> checkMenuRouterFromRedis() {
        List<MenuRouterDto> cacheList = redisCache.getCacheList(RedisConst.MENU_ROUTER_LIST);
        System.out.println(cacheList);
        if (AssertUtil.isNotEmpty(cacheList)) {
            return cacheList;
        }
        return null;
    }
}
