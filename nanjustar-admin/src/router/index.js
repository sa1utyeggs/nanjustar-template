import Vue from 'vue'
import VueRouter from 'vue-router'

// 解决ElementUI导航栏中的vue-router在3.0版本以上重复点菜单报错问题
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}

//=======================  组件引入  ===========================
const Login = () => import('@/views/Login');
const Home = () => import('@/layout/Home');
const Welcome = () => import('@/views/welcome/Welcome');
const NotFound = () => import('@/views/error/NotFound');
//=======================  组件引入  ===========================

Vue.use(VueRouter);

const routes = [
    {
        path: '/',
        redirect: '/login'
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/home',
        name: '楠橘星',
        component: Home,
        redirect: '/welcome',
        children: [
            {
                path: '/welcome',
                name: '首页',
                component: Welcome
            }
        ],
    },
    // {
    //     path: '*',
    //     component: NotFound
    // }

]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
});


export default router