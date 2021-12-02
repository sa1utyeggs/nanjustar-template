<template>
  <div class="animate__animated animate__fadeIn">
    <el-card style="margin:  10px -10px;width: 100%;">
      <el-row style="margin-bottom: 10px">
        <el-collapse>
          <el-collapse-item title="后端学习" name="1">
            <div>平时学习做项目过程中一直在开发后端接口✍️，但是没有前台界面来展示出效果</div>
            <div>枯燥的后端开发让你决定自己开发界面🧐，你开始学习vue了～～</div>
          </el-collapse-item>
          <el-collapse-item title="vue学习" name="2">
            <div>vue 端学习一直顺风顺水🤗，直到你决定要自己去搭建后台...</div>
            <div>你会发现页面端布局、侧边菜单的布置、顶部历史菜单的设计 让你抱头痛哭😭，你开始转向了开源项目...</div>
          </el-collapse-item>
          <el-collapse-item title="开源项目学习" name="3">
            <div>看着开源项目的预览，真的棒，我要用！！！👍</div>
            <div>但是问题页随之而来 npm install Error是什么鬼👀？？ 经历了千辛万苦终于把依赖拉下来了！！😄</div>
            <div>这代码好多啊！这么多js！封装这么严重！看不懂啊🤔！！！ 最终你选择去寻找简洁版的后台管理界面！🥺</div>
          </el-collapse-item>
          <el-collapse-item title="楠橘星后台管理" name="4">
            <div>是的，我想说的就是 我就是你要找的简洁版后台管理界面😎</div>
            <div>我以及搭建好了侧边栏、面包屑、以及顶部历史菜单。 剩下了由你来设计🤠</div>
            <div>如果我的项目可以帮到你，请点亮一个小小的star 🌟🌟</div>
          </el-collapse-item>
        </el-collapse>
      </el-row>
      <el-descriptions class="margin-top" title="当前用户信息" :column="3" size="medium" border>
        <el-descriptions-item>
          <template slot="label"><i class="el-icon-user"></i>头像</template>
          <el-image
              style="width: 48px; height: 48px;border-radius: 50%"
              :src="userInfo.avatar"
              :preview-src-list="avatar">
          </el-image>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label"><i class="el-icon-user"></i>用户名</template>
          {{ userInfo.username }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user"></i>昵称
          </template>
          {{ userInfo.nickname }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-mobile-phone"></i>手机号
          </template>
          {{ userInfo.phonenum }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-location-outline"></i>登陆ip
          </template>
          {{ userInfo.loginIp }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label"><i class="el-icon-tickets"></i>登陆地址</template>
          <el-tag size="small">{{ userInfo.loginAddress }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">登陆方式</template>
          <el-tag size="info">{{ userInfo.loginType }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">操作系统</template>
          <el-tag size="small" type="success">{{ userInfo.os }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">登陆系统</template>
          <el-tag size="small" type="warning">{{ userInfo.browser }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">个人简介</template>
          树苗如果因为怕痛而拒绝修剪，那就永远不会成材。
        </el-descriptions-item>
      </el-descriptions>
      <el-row style="margin-top: 10px" :gutter="20">
        <el-col :span="8">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>后端技术</span>
            </div>
            <div>· SpringBoot 多模块</div>
            <div>· SpringSecurity</div>
            <div>· MybatisPlus</div>
            <div>· JWT</div>
            <div>· FastJson</div>
            <div>· SpringBoot 多模块</div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>前端技术</span>
            </div>
            <div>· HTML、CSS、JS三件套</div>
            <div>· vue 2.*</div>
            <div>· Element UI</div>
            <div>· Axios</div>
            <div>· Vuex</div>
            <div>· lottie 动画</div>
            <div>· 腾讯云验证码</div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>开发环境</span>
            </div>
            <div>· JDK 8</div>
            <div>· MySql 8.*</div>
            <div>· Maven 3.6.3</div>
            <div>· Node 16.13.0</div>
            <div>· Java开发 IDEA</div>
            <div>· Vue开发 WebStorm</div>
          </el-card>
        </el-col>
      </el-row>

    </el-card>
  </div>
</template>

<script>
import {mapState} from "vuex";

export default {
  data() {
    return {
      avatar: [],
    }
  },
  computed: {
    ...mapState(['userInfo'])
  },
  created() {
    this.avatar.push(this.userInfo.avatar);
  }
}
</script>

<style>

</style>