# 💫💫💫楠橘星后台管理（简洁版）

<p align=center>
  <a href="#">
    <img src="https://nanju-edu.oss-cn-beijing.aliyuncs.com/CoverTemplate/nanjustarLogo.png" alt="风丶宇的个人博客" style="border-radius: 50%">
  </a>
</p>
<p align=center>
   <strong>SpringBoot 多模块 + Vue 的简洁版后台管理系统</strong>
</p>



<p align="center">
   <a target="_blank" href="https://gitee.com/duan_nan/nanjustar-template/tree/master">
      <img src="https://img.shields.io/badge/SpringBoot-%E5%A4%9A%E6%A8%A1%E5%9D%97-orange"/>
      <img src="https://img.shields.io/badge/JDK-1.8-yellowgreen"/>
      <img src="https://img.shields.io/badge/SpringSecurity-%E6%9D%83%E9%99%90-brightgreen"/>
      <img src="https://img.shields.io/badge/Mysql-8.0.25-yellowgreen"/>
      <img src="https://img.shields.io/badge/MyBatisPlus-3.4.2-orange"/>
      <img src="https://img.shields.io/badge/spring--Redis-2.5.5-blue"/>
      <img src="https://img.shields.io/badge/vue-2.6.11-red"/>
      <img src="https://img.shields.io/badge/axios-0.24.0-green"/>
      <img src="https://img.shields.io/badge/vuex-3.4.0-yellow"/>
      <img src="https://img.shields.io/badge/element--ui-2.15.6-yellowgreen"/>
      <img src="https://img.shields.io/badge/lottie-%E5%8A%A8%E7%94%BB-brightgreen"/>
      <img src="https://img.shields.io/badge/Tencent-%E9%AA%8C%E8%AF%81%E7%A0%81-yellow"/>
   </a>
</p>


## 在线预览



**项目链接：**[http://49.235.248.222/](http://49.235.248.222/)

**接口链接：**[http://49.235.248.222:9090/doc.html/](http://49.235.248.222:9090/doc.html)

超级管理员账号：nanjustar    密码：123456

普通管理员账号：admin		  密码：123456

**GitHub地址：**[https://github.com/duan-nan/nanjustar-template](https://github.com/duan-nan/nanjustar-template)

**Gitee地址：**   [https://gitee.com/duan_nan/nanjustar-template](https://gitee.com/duan_nan/nanjustar-template)



## v1.1更新

1. 界面效果优化，使界面更加丝滑顺畅。（动画优化）
2. 完成菜单管理界面部分功能（部分功能）
3. 新增图标库到项目中（Elementui 图标）
4. 新增日志管理记录（aop + 自定义注解）
5. 新增在线预览

# CSDN动态
## [nanjustar 后台管理 专栏](https://blog.csdn.net/nanshen__/category_11488844.html?spm=1001.2014.3001.5482)
##### [(一)nanjustar 楠橘星后台管理系统（简洁版）使用导航](https://blog.csdn.net/nanshen__/article/details/121440416?spm=1001.2014.3001.5501)


# 前言

		为什么要做这个项目呢？因为我主要是做java的，平时学习做项目过程中一直在开发后端接口🖌，枯燥的后端开发让我决定自己开发界面🧐。
	
		vue 端学习一直顺风顺水🤗，直到我决定要自己去搭建后台。。我发现页面端布局、侧边菜单的布置、顶部历史菜单的设计 让我抱头痛哭😭，我开始转向了开源项目... 
	
		看着开源项目的预览，真的棒，我要用！！！👍  但是问题页随之而来 *npm install Error*是什么鬼👀？？ 经历了千辛万苦终于把依赖拉下来了！！😄 但是这这代码好多啊！这么多js！封装这么严重！看不懂啊🤔！！！ 最终你选择去寻找简洁版的后台管理界面！🥺
	
		是的，我想说的就是 我就是你要找的简洁版后台管理界面😎。我们以及搭建好了侧边栏、面包屑、以及顶部历史菜单。 剩下了所有的界面都由你来设计🤠，来完成你自己的作品。
	
		如果我的项目可以帮到你，请点亮一个小小的star 🌟🌟

# 目录结构
项目地址：**GItee:**  https://gitee.com/duan_nan/nanjustar-template

🌟🌟🌟`nanjusatr-admin`是我们的前端项目。🌟🌟🌟

⭐️⭐️⭐️`nanjustar`是我们的后端项目。⭐️⭐️⭐️

🌈🌈🌈`nanjustar.sql` 是我们需要使用到的数据库文件，数据库需要使用MySql 8以上的版本。🌈🌈🌈

☀️☀️☀️我们将项目直接拉取到本地之后，只需要进行简单的配置即可启动使用。☀️☀️☀️

数据库：

```tex
在本地中新建数据库 nanjustar（也可以根据自身需求进行更改名称），之后运行nanjustar.sql文件。
```

后端配置：

```tex
1. 数据库配置
  我们进入到 nanjustar-mapper 模块中，找到 application-mapper.yml 配置文件进行配置修改,修改数据库url至自己到数据库位置，修改username和password。
  
2. Redis配置
  我们进入到 nanjustar-business 模块中，找到 application-bussiness.yml	配置文件进行配置修改，修改reids 到主机名称，修改至自己redis的即可。
```

前端配置：

```tex
前端项目只需要执行 npm install 或 cnpm install 即可
```



✨✨✨前后端项目启动之后，我们有两个用户 **nanjustar/123456（超级管理员）** 和 **admin/123456 （管理员）**，超级管理员拥有权限管理目录的权限，而管理员并不拥有，所以他们的前端侧边栏菜单是不一样的。✨✨✨



后端项目结构：

```
├──nanjusatr	    --  --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar父工程
		├── nanjustar-api     	  --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar-api模块
    		├── src
						├── java
									├── moudle
												├── security  						    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  权限模块
																├── api  							-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  业务接口
																├── dto 			    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  dto数据返回类
																├── model					  		-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  实体类
																├── vo  					-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  vo参数接收类
						├── resource
									├── application-api.yml        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  api模块配置文件
				├── pom.xml
		├── nanjustar-business          --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar业务模块
    			├── src
							├── java
									├── business              -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  业务实现类
									├── config								-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  配置类
									├── filter								-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  过滤器包
									├── handler								-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  处理器包
									├── util 									-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  工具包
							├── resource
											├── application-business.yml  -- -- -- -- -- -- -- -- -- -- -- -- --  business模块配置文件
						├── pom.xml      -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- nanjustar业务模块  Pom文件
		├── nanjustar-common     -- -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar共用模块
						├── src
								├── java
											├── annotation				 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  注解包
											├── aop                -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  切面包
											├── config             -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  配置包
											├── constant            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 常量包
											├── core	             -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  基础包
											├── enums							 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  枚举包
											├── exception			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  自定义异常包
											├── result				-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  统一结果集包
											├── utils							 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  工具包
								├── resource		
												├── application-common.yml
						├── pom.xm   -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar共用模块 Pom文件
		├── nanjustar-mapper     -- -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar数据模块
						├── src
								├── java
    									├── config	                    -- -- -- -- -- -- -- -- -- -- -- -- -- -- --   数据库配置
    									├── handler		               -- -- -- -- -- -- -- -- -- -- -- -- -- -- --   handler处理器
    									├── mapper		                -- -- -- -- -- -- -- -- -- -- -- -- -- -- --   *.Mapper接口
								├── resource	
												├── mapper          -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  mapper.xml 存放位置
       		 							├── application-mapper.yml     	  - -- -- -- -- -- -- -- --  nanjustar数据模块 配置文件
       		 ├── pom.xml -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar数据模块  Pom文件
		├── nanjustar-web     -- -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar-wen 模块
				├── src
						├── java
									├── controller         -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar controller
									├── NanjustarApplication.java           -- -- -- -- -- -- -- -- -- -- --  nanjustar主启动类
						├── resource
									├── application.yml     -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar-web 配置文件
									├── application-dev.yml -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar-web 配置文件
				├── pom.xml    -- -- --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar-web  Pom文件
				
├── pom.xml	    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  nanjustar父工程Pom文件
```



前端项目结构：

```tex
nanjustar-admin
			├── public   
						├── js              -- -- -- -- -- -- js文件夹
								├── lottie.js   -- -- -- -- -- --  动画js
						├── favicon.ico     -- -- -- -- -- -- Logo 图标
						├── index.html      -- -- -- -- -- -- index.html  
			├── src
					 ├── api							-- -- -- -- -- -- api接口目录
					 ├── assets						-- -- -- -- -- -- 静态资源目录
					 ├── component				-- -- -- -- -- -- 组件目录 
					 ├── layout						-- -- -- -- -- -- 布局目录
					 ├── router						-- -- -- -- -- -- 路由目录
					 ├── store						-- -- -- -- -- -- 缓存目录  
					 ├── utils						-- -- -- -- -- -- 工具目录
					 ├── views						-- -- -- -- -- -- 界面目录
					 ├── App.vue					-- -- -- -- -- -- App.vue
					 ├── main.js					-- -- -- -- -- -- main.js
		  ├── babel.config.js
		  ├── package.json				  -- -- -- -- -- -- package.json  
		  ├── package-locak.json
		  ├── vue.config.js					-- -- -- -- -- -- vue.config.js

```



# 项目特点

- 后端开发参考“若依开源项目”，“风宇个人博客”进行开发。
- 后台使用"element-ui"设计，侧边栏，历史标签，面包屑自动生成等。
- 前台菜单路由通过数据库查询，根据登陆用户的权限等级进行获取渲染，实现权限分级。
- 登陆界面采用 lottie 动画，极大的提升了项目的美观度。
- 后台界面仅开发欢迎界面，给使用者留下足够空间，便于进行二次开发。
- 前端代码层次简单，没有进行严重封装，便于后段开发者阅读扩展开发。
- 代码遵循阿里巴巴开发规范，代码整洁，便于进行二次开发。



# 运行环境

| 开发工具 | 说明              |
| -------- | ----------------- |
| IDEA     | Java开发工具IDE   |
| WebStorm | Vue开发工具IDE    |
| Navicat  | MySQL远程连接工具 |
| Medis    | Redis远程连接工具 |



| 开发环境     | 版本   |
| ------------ | ------ |
| JDK          | 1.8    |
| MySQL        | 8.0.25 |
| spring-Redis | 2.5.5  |
| Vue          | 2.6.11 |
| Vex          | 3.4.0  |



# 项目截图
![在这里插入图片描述](https://img-blog.csdnimg.cn/26a03e793cee4ac593c4422aededa93e.gif#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/c68068e86e844471a950803b756f8830.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/708387d99d144fff9e92ad079244e6ff.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/fcce28f8a73a4cd8ae120648ffec0606.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)

![在这里插入图片描述](https://img-blog.csdnimg.cn/31f99f6288084ccca494a65a7cf58826.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)

![在这里插入图片描述](https://img-blog.csdnimg.cn/f39ef40fe54c4a70906c9d8038243cec.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)

![在这里插入图片描述](https://img-blog.csdnimg.cn/93dcf0e5dd5e4d3ea9b08a4b97082731.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)

## 交流群

![在这里插入图片描述](https://img-blog.csdnimg.cn/bbfe1a7b95f2463ebbb0ccdcd83003a5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5qWg5qmY5pif,size_20,color_FFFFFF,t_70,g_se,x_16)
