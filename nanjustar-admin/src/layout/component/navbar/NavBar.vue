<template>
  <div class="nav-container">
    <div class="left-container">
      <div class="change" @click="setCollapse">
        <el-icon :class="isCollapse?'close el-icon-s-unfold':'close el-icon-s-fold'"/>
      </div>
      <bread></bread>
    </div>
    <div class="right-container">
      <el-tooltip content="全屏" placement="bottom">
        <svg @click="fullPage" class="icon" aria-hidden="true">
          <use xlink:href="#nanjustar-quanping-"></use>
        </svg>
      </el-tooltip>
      <el-tooltip content="Github" placement="bottom">
        <svg @click="toGithub" class="icon" aria-hidden="true">
          <use xlink:href="#nanjustar-github"></use>
        </svg>
      </el-tooltip>
      <el-tooltip content="用户身份" placement="bottom">
        <el-tag class="level">{{ userInfo.consumerLevel }}</el-tag>
      </el-tooltip>
      <el-dropdown class="dropdown" trigger="click" @command="handleCommand">
        <img class="avatar" :src="userInfo.avatar">
        <i class="el-icon-arrow-down el-icon--right"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item icon="el-icon-s-custom" command="personCenter">个人中心</el-dropdown-item>
          <el-dropdown-item icon="el-icon-s-operation" command="layoutSetting">布局设置</el-dropdown-item>
          <el-dropdown-item divided icon="el-icon-moon" command="logout">退出登陆</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>

    </div>
  </div>
</template>

<script>
import Bread from "@/layout/component/navbar/Bread";
import {mapMutations, mapState} from "vuex";
import {messageInfo} from "@/utils/MessageInfo";
import {getConsumerInfo} from "../../../api/consumer/consumerApi";

export default {
  name: "NavBar",
  components: {
    Bread
  },
  computed: {
    ...mapState(['isCollapse','userInfo']),
  },
  created() {
    getConsumerInfo()
    .then(res => {
      this.consumerLevel = res.data.consumerLevel;
      this.avatar = res.data.avatar;
    })
  },
  methods: {
    ...mapMutations(['setCollapse', 'logout']),
    fullPage() {
      let element = document.documentElement;
      if (this.fullscreen) {
        if (document.exitFullscreen) {
          document.exitFullscreen();
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.msExitFullscreen) {
          document.msExitFullscreen();
        }
      } else {
        if (element.requestFullscreen) {
          element.requestFullscreen();
        } else if (element.webkitRequestFullScreen) {
          element.webkitRequestFullScreen();
        } else if (element.mozRequestFullScreen) {
          element.mozRequestFullScreen();
        } else if (element.msRequestFullscreen) {
          element.msRequestFullscreen();
        }
      }
      this.fullscreen = !this.fullscreen;
    },
    toGithub() {
      window.open("https://gitee.com/duan_nan/nanjustar-template");
    },
    handleCommand(command) {
      if (command === 'personCenter') {

      } else if (command === 'layoutSetting') {

      } else if (command === 'logout') {
        this.consumerLogout();
      }
    },
    consumerLogout() {
      this.$confirm('确定要退出系统?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.logout();
        this.$router.replace("/");
        window.sessionStorage.removeItem('vuex');
        messageInfo({message: "退出成功！"});
      })
    },
  }
}
</script>

<style scoped>
.nav-container {
  display: flex;
  justify-content: space-between;
  width: 100%;
  line-height: 50px;
  align-items: center;
}

.change {
  cursor: pointer;
  font-size: 26px;
}

.left-container {
  display: flex;
  justify-content: left;
  align-items: center;
}

.right-container {
  display: flex;
  justify-content: right;
  align-items: center;
}

.right-container .icon {
  cursor: pointer;
  width: 30px;
  height: 30px;
  margin-right: 15px;
}

.right-container .level {
  cursor: pointer;
  margin-right: 15px;
}

.right-container .dropdown {
  height: 40px;
}

.right-container .dropdown .avatar {
  cursor: pointer;
  width: 40px;
  height: 40px;
  border-radius: 10px;
}
</style>