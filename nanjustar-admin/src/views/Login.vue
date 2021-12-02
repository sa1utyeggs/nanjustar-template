<template>
  <div class="main-container">
    <div class="login-container">
      <el-form
          ref="loginForm"
          :model="loginForm"
          :rules="loginRules"
          class="login-form"
      >
        <h3 class="title">楠橘星后台管理系统</h3>
        <el-form-item prop="username">
          <el-input
              v-model="loginForm.username"
              type="text"
              placeholder="账号"
              prefix-icon="el-icon-user-solid"
              @keyup.enter.native="handleLogin"
          >
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
              v-model="loginForm.password"
              type="password"
              prefix-icon="el-icon-s-help"
              placeholder="密码"
              @keyup.enter.native="handleLogin"
          >
          </el-input>
        </el-form-item>
        <el-checkbox v-model="loginForm.rememberMe" style="margin-bottom: 25px"
        >记住密码
        </el-checkbox
        >
        <el-form-item style="width: 100%">
          <el-button
              :loading="loading"
              size="medium"
              style="width: 100%;background-color: #5839ac;color: #ffffff"
              @click.native.prevent="handleLogin"
          >
            <span v-if="!loading">登 录</span>
            <span v-else>登 录 中...</span>
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="spaceMan-parent">
      <!--动画-->
      <lottie-player
          src="https://assets6.lottiefiles.com/packages/lf20_Ns4TLz.json"
          background="transparent"
          speed="1"
          class="spaceMan"
          loop
          autoplay
      >
      </lottie-player>
    </div>
    <lottie-player
        src="https://assets4.lottiefiles.com/packages/lf20_zprb9vzj.json"
        background="transparent"
        speed="1"
        class="bg"
        loop
        autoplay
    >
    </lottie-player>
    <lottie-player
        src="https://assets4.lottiefiles.com/packages/lf20_zprb9vzj.json"
        background="transparent"
        speed="1"
        class="bg"
        loop
        autoplay
    >
    </lottie-player>
  </div>
</template>

<script>
import {messageInfo} from "@/utils/MessageInfo";
import {Login} from "@/api/login/login";

export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username: "nanjustar",
        password: "123456",
        rememberMe: false,
      },
      loginRules: {
        username: [
          {required: true, trigger: "blur", message: "请输入您的账号"},
        ],
        password: [
          {required: true, trigger: "blur", message: "请输入您的密码"},
        ],
      },
      loading: false,
    };
  },
  methods: {
    handleLogin() {
      var that = this;
      this.loading = true;
      let captcha = new TencentCaptcha(this.config.TENCENT_CAPTCHA, function (res) {
        if (res.ret === 0) {
          Login(that.loginForm).then((res) => {
            if (res.status) {
              window.sessionStorage.setItem("token", res.data);
              that.loading = false;
              that.$router.replace("/home");
              messageInfo({message: "登陆成功！"});
            } else {
              that.loading = false;
            }
          });
        } else {
          that.loading = false;
          messageInfo({type: "error", message: "请重新验证！"});
        }
      });
      captcha.show();
    },
  },
};
</script>

<style scoped>
.main-container {
  position: relative;
  width: 100%;
  height: 100%;
}

.login-container {
  z-index: 1;
  position: absolute;
  left: 0;
  height: 100%;
  width: 30%;
  background-color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 6px;
  box-shadow: 2px 3px 3px #888888;
  opacity: 0.9;
}

.login-form {
  z-index: 1;
  width: 85%;
}

.title {
  margin: 0 auto 30px auto;
  text-align: center;
  color: #707070;
  font-size: 26px;
}

.spaceMan-parent {
  position: absolute;
  right: 0;
  width: 70%;
  height: 100%;
}

.spaceMan {
  z-index: 1;
  position: absolute;
  width: 500px;
  height: 500px;
  left: 0;
  top: 0;
  bottom: 10%;
  right: 30%;
  margin: auto auto;
  transform: translate(-50% -50%);
}

.bg {
  z-index: -2;
  width: 1550px;
  overflow: hidden;
}
</style>