<template>
  <el-container>
    <el-aside :width="isCollapse?'60px':'210px'" class="side">
      <side-bar></side-bar>
    </el-aside>
    <el-container>
      <el-header>
        <nav-bar :key="$route.path + 1"/>
      </el-header>
      <el-main>
        <nav-list class="navList" :key="$route.path + 1"></nav-list>
        <router-view/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import NavBar from "@/layout/component/navbar/NavBar";
import SideBar from "@/layout/component/sidebar/SideBar";
import NavList from "@/layout/component/navbar/NavList";
import {mapState} from "vuex";

export default {
  name: "Home",
  components: {
    NavBar,
    SideBar,
    NavList
  },
  computed: {
    ...mapState(['isCollapse']),
  },
  created() {
    this.$notify.success({
      message: "欢迎👏来到 楠橘星后台管理系统。" +
          "详情访问 <a href='https://gitee.com/duan_nan/nanjustar-template'>https://gitee.com/duan_nan/nanjustar-template</a>",
      duration: 5000,
      dangerouslyUseHTMLString: true,
    })

  }
}
</script>

<style scoped>

.el-container {
  height: 100%;
}

.el-header, .el-footer {
  height: 50px !important;
  line-height: 50px;
}

.el-aside {
  line-height: 200px;
  height: 100%;
  background-color: #304156;
}

.el-main {
  height: 100%;
  width: 100%;
}
.side{
  box-shadow: 2px 8px 5px #888888;
  overflow-x: hidden;
}

.navList {
  margin: -19px -15px 10px -15px;
}
</style>