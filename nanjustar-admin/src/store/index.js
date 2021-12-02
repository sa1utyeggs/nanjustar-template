import Vue from 'vue'
import Vuex from 'vuex'
import persistedState from 'vuex-persistedstate'
import da from "element-ui/src/locale/lang/da";

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        menuList: [],
        tabList: [],
        isCollapse: false,
        userInfo: {},
    },
    mutations: {
        // 保存标签
        saveTab(state, tab) {
            if (state.tabList.findIndex(item => item.path === tab.path) == -1) {
                state.tabList.push({name: tab.name, path: tab.path});
            }
        },
        // 移除标签
        removeTab(state, tab) {
            if (tab.name !=="首页"){
                var index = state.tabList.findIndex(item => item.name === tab.name);
                state.tabList.splice(index, 1);
            }
        },
        // 重置标签
        resetTab(state) {
            state.tabList = [{name: "首页", path: "/welcome"}];
        },
        // 侧边栏折叠
        setCollapse(state) {
            state.isCollapse = !state.isCollapse;
        },
        // 设置菜单栏
        setMenulist(state, data) {
            state.menuList = data;
        },
        // 用户退出
        logout(state) {
            //  删除 token
            window.sessionStorage.removeItem('token');
            // 删除用户信息
            window.sessionStorage.removeItem('userInfo');
            // 删除缓存信息
            window.sessionStorage.removeItem('vuex');
        },
        // 设置用户信息
        setUserInfo(state, data) {
            state.userInfo = data;
        }
    },
    actions: {
        setMenulist(context, data) {
            context.commit('setMenulist', data);
        },
        setUserInfo(context, data) {
            context.commit('setUserInfo', data);
        },
        saveTab(context, data) {
            context.commit('saveTab', data);
        },
    },
    modules: {},
    //持久化存储
    plugins: [persistedState({storage: window.sessionStorage})],
});
