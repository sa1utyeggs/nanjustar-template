import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


//=======================  CSS  ===========================
import 'animate.css';

//=======================  JS  ===========================
import config from "@/assets/js/config";

//=======================  Utils  ===========================
import {initMenu} from './utils/menu';
//=======================  UI/插件 ===========================
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// 滚动条
import Nprogress from 'nprogress';
import {getUserInfo} from "./api/consumer/consumerApi";

//=======================  全局变量  ===========================
Vue.config.productionTip = false
Vue.prototype.config = config;
//=======================  Vue引用  ===========================
Vue.use(ElementUI);


//=======================  路由守卫  ===========================
router.beforeEach(((to, from, next) => {
    Nprogress.start();
    if (window.sessionStorage.getItem('token')) {
        if (router.options.routes[2].children.length <= 1) {
            initMenu(router, store);
        }
        if (!window.sessionStorage.getItem('userInfo')) {
            getUserInfo()
                .then(res => {
                    store.dispatch('setUserInfo', res.data)
                });
        }
        next();
    } else {
        if (to.path === '/login') {
            next();
        } else {
            next('/login');
        }
    }
}));

router.afterEach(((to, from) => {
    Nprogress.done();
}));


//=======================  Vue  ===========================
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
