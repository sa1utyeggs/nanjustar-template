<template>
  <div class="main-container">
    <div class="logo-container">
      <logo :collapse="isCollapse"></logo>
    </div>
    <div class="menu-container">
      <el-scrollbar wrap-class="scrollbar-wrapper">
        <el-menu
            :collapse="isCollapse"
            :unique-opened="true"
            :default-active="this.$route.path"
            :collapse-transition="false"
            background-color="#304156"
            text-color="#fff"
            active-text-color="#5a9cf8"
            router
        >
          <el-menu-item
              v-for="(menu, index) in this.menuList"
              :key="index"
              :index="menu.path"
              v-if="menu.component !== 'Layout'"
          >
            <el-icon :class="menu.icon"/>
            <span>{{ menu.menuName }}</span>
          </el-menu-item>

          <el-submenu
              v-if="menu.component === 'Layout'"
              v-for="(menu, index) in this.menuList"
              :key="index"
              :index="menu.path"
          >
            <template slot="title">
              <i :class="menu.icon"></i>
              <span>{{ menu.menuName }}</span>
            </template>
            <el-menu-item
                v-for="(item, index) in menu.children"
                :key="index"
                :index="item.path"
            >
              <el-icon :class="item.icon"/>
              <span>{{ item.menuName }}</span>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-scrollbar>
    </div>
  </div>
</template>

<script>
import Logo from "@/layout/component/sidebar/Logo";
import {mapState} from "vuex";

export default {
  name: "SideBar",
  components: {
    Logo,
  },
  computed: {
    ...mapState(["isCollapse", "menuList"]),
  },
};
</script>

<style scoped>
.main-container {
  width: 101%;
  height: 100%;
}

.main-container .logo-container {
  width: 100%;
  height: 50px;
  line-height: 50px;
  text-align: center;
}
</style>