package com.nanjustar.api.moudle.security.api;

import com.nanjustar.api.moudle.security.dto.MenuBackDto;
import com.nanjustar.api.moudle.security.dto.MenuRouterDto;
import com.nanjustar.api.moudle.security.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.nanjustar.api.moudle.security.vo.MenuVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
public interface MenuService extends IService<Menu> {

    /**
     * 查询菜单路由信息
     * @return {@link MenuRouterDto} 菜单路由信息
     */
    List<MenuRouterDto> listMenuRouter();

    /**
     * 通过id查询菜单信息
     * @param id 菜单id
     * @return {@link MenuBackDto} 菜单信息
     */
    MenuBackDto getMenuById(Integer id);

    /**
     * 查询父级菜单信息
     * @return {@link MenuBackDto} 菜单信息
     */
    List<MenuBackDto> listParentMenu();

    /**
     *  新增菜单信息
     * @param menuVo 菜单信息 vo类
     */
    void saveMenu(MenuVo menuVo);

    /**
     * 修改菜单信息
     * @param menuVo 菜单信息 vo类
     */
    void updateMenu(MenuVo menuVo);

    /**
     * 删除菜单信息
     * @param id 菜单id
     */
    void deleteMenu(Integer id);

    /**
     * 批量删除菜单信息
     * @param idList id集合
     */
    void deleteMenu(List<Integer> idList);
}
