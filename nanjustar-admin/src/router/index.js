import Vue from 'vue'
import VueRouter from 'vue-router'

//=======================  组件引入  ===========================
const Login = () => import('@/views/Login');
const Home = () => import('@/layout/Home');
const Welcome = () => import('@/views/welcome/Welcome');
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
    }

]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router