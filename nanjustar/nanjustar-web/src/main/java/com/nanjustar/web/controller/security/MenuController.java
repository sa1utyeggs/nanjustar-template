package com.nanjustar.web.controller.security;


import com.nanjustar.api.moudle.security.api.MenuService;
import com.nanjustar.api.moudle.security.dto.MenuBackDto;
import com.nanjustar.api.moudle.security.dto.MenuRouterDto;
import com.nanjustar.api.moudle.security.entity.Menu;
import com.nanjustar.api.moudle.security.vo.MenuVo;
import com.nanjustar.common.result.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@RestController
@Api(tags = "菜单模块")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * 查询菜单列表
     *
     * @return {@link MenuRouterDto} 菜单路由信息
     */
    @ApiOperation(value = "查询菜单路由列表")
    @GetMapping("/menu/consumerRouterList")
    public ResponseResult<List<MenuRouterDto>> list() {
        return ResponseResult.success("菜单路由列表获取成功！", menuService.listMenuRouter());
    }

    /**
     * 查询父级菜单信息
     *
     * @return {@link MenuBackDto} 菜单信息
     */
    @ApiOperation(value = "查询父级菜单信息")
    @GetMapping("/menu/listParentMenu")
    public ResponseResult<List<MenuBackDto>> listMenuBackDto() {
        return ResponseResult.success("查询父级菜单信息成功！", menuService.listParentMenu());
    }

    /**
     * 通过id查询菜单信息
     *
     * @param id 菜单主键
     * @return {@link MenuBackDto} 菜单信息
     */
    @ApiOperation(value = "通过id查询菜单信息")
    @GetMapping("/menu/getMenu/{id}")
    public ResponseResult<MenuBackDto> getMenuBack(@PathVariable Integer id) {
        return ResponseResult.success("菜单信息查询成功！", menuService.getMenuById(id));
    }

    /**
     * 新增菜单信息
     *
     * @param menuVo 菜单信息 vo类
     * @return {@link ResponseResult} 菜单新增状态
     */
    @ApiOperation(value = "新增菜单信息")
    @PostMapping("/menu/saveMenu")
    public ResponseResult<String> saveMenu(@RequestBody @Valid MenuVo menuVo) {
        menuService.saveMenu(menuVo);
        return ResponseResult.success("菜单新增成功！");
    }

    /**
     * 修改菜单信息
     *
     * @param menuVo 菜单信息 vo类
     * @return {@link ResponseResult} 菜单修改状态
     */
    @ApiOperation(value = "修改菜单信息")
    @PutMapping("/menu/updateMenu")
    public ResponseResult<String> updateMenu(@RequestBody @Valid MenuVo menuVo) {
        menuService.updateMenu(menuVo);
        return ResponseResult.success("菜单修改成功！");
    }

    /**
     * 删除菜单信息
     *
     * @param id 菜单id
     * @return 菜单删除状态
     */
    @ApiOperation(value = "删除菜单信息")
    @DeleteMapping("/menu/deleteMenu/{id}")
    public ResponseResult<String> deleteMenu(@PathVariable Integer id) {
        menuService.deleteMenu(id);
        return ResponseResult.success("菜单删除成功！");
    }

    /**
     * 批量删除菜单信息
     *
     * @param idList 菜单id集合
     * @return 菜单批量删除状态
     */
    @ApiOperation(value = "批量删除菜单信息")
    @DeleteMapping("/menu/deleteMenu")
    public ResponseResult<String> deleteMenu(@RequestParam List<Integer> idList) {
        menuService.deleteMenu(idList);
        return ResponseResult.success("菜单批量删除成功！");
    }
}

