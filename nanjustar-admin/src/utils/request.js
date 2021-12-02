import {messageInfo} from "@/utils/MessageInfo";
import axios from "axios";

//=======================  请求拦截器  ===========================
axios.interceptors.request.use(
    config => {
        if (window.sessionStorage.getItem('token')) {
            config.headers['Authorization'] = window.sessionStorage.getItem('token');
        }
        return config;
    }, error => {
        console.log("Something Wrong With The Request ==>  ", error);
    }
)

//=======================  相应拦截器  ===========================
axios.interceptors.response.use(
    res => {
        if (res.status && res.status === 200) {
            //  业务逻辑
            if (res.data.code === 50000 || res.data.code === 401 || res.data.code === 40003) {
                messageInfo({type: "error", message: res.data.message});
                return res.data.status = false;
            } else {
                return res.data;
            }
        }
        messageInfo({type: "error", message: "连接错误！"});
        return;
    }, error => {
        if (error.response.code === 404 || error.response.code === 504) {
            messageInfo({type: "error", message: "服务器被怪兽吃了  ┴┴︵╰（‵□′）╯︵┴┴ "});
        } else if (error.response.code === 403) {
            messageInfo({type: "error", message: "权限不足，请联系管理员！"});
        } else if (error.response.code === 401) {
            messageInfo({type: "error", message: "尚未登陆，请登陆！"});
            this.$router.replace('/');
        } else {
            if (error.response.message) {
                messageInfo({type: "error", message: error.response.message});
            } else {
                messageInfo({type: "error", message: "网络异常！"});
            }
        }
        return;
    }
);

//=======================  请求封装  ===========================
let baseUrl = "/v2/api";

// Get
export const getRequest = (url, params) => {
    return axios({
        method: 'get',
        url: `${baseUrl}${url}`,
        params: params
    })
}

// Post
export const dataPostRequest = (url, data) => {
    return axios({
        method: 'post',
        url: `${baseUrl}${url}`,
        data: data
    })
}

//Post
export const paramsPostRequest = (url, params) => {
    return axios({
        method: 'post',
        url: `${baseUrl}${url}`,
        params: params
    })
};

// Put
export const paramsPutRequest = (url, params) => {
    return axios({
        method: 'put',
        url: `${baseUrl}${url}`,
        params: params
    })
}

// Put
export const dataPutRequest = (url, data) => {
    return axios({
        method: 'put',
        url: `${baseUrl}${url}`,
        data: data
    });
};

// delete
export const deleteRequest = (url, params) => {
    return axios({
        method: 'delete',
        url: `${baseUrl}${url}`,
        params: params
    })
}