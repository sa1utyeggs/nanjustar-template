

module.exports = {

    
    // 代理配置
    devServer: {
        port: 2048,
        proxy: {
            '/v2/api': {
                target: 'http://localhost:9090',
                changeOrigin: true,
                pathRewrite: {
                    '^/v2/api': ''
                }
            }
        }
    }



};