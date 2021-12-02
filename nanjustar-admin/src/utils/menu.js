
import { messageInfo } from "@/utils/MessageInfo";
import {listMenu} from "../api/menu/permApi";

export const initMenu = (router, store) => {

    //获取菜单信息
    listMenu()
        .then(res => {
            if (res.status) {
                //格式化路由信息
                let fmtRoutes = formatRoutes(res.data);
                //将格式化完成后的路由加载进入路由中
                fmtRoutes.forEach(fmtRoute => {
                    if (fmtRoute.children.length > 0) {
                        for (let i = 0; i < fmtRoute.children.length; i++) {
                            router.options.routes[2].children.push(fmtRoute.children[i]);
                        }
                    }
                });
                //将路由信息存入store中
                store.dispatch('setMenulist', res.data);
                //重新加载路由
                router.addRoutes(router.options.routes);
            } else {
                messageInfo({type:'error',message:res.message});
            }
        });
};

export const formatRoutes = (menus) => {
    let fmtMenus = [];
    menus.forEach(menu => {
        //抽取出部分属性
        let {
            menuId,
            menuName,
            path,
            icon,
            component,
            children,
        } = menu;

        //递归遍历
        if (children && children instanceof Array) {
            children = formatRoutes(children);
        }

        let fmtRoute = {
            id: menuId,
            name: menuName,
            path: path,
            icon: icon,
            children: children,
            component(resolve) {
                if (component !== 'Layout') {
                    require(['../views' + component], resolve);
                }
            }
        };
        fmtMenus.push(fmtRoute);
    });
    return fmtMenus;
};
