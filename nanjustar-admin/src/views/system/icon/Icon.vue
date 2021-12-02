<template>
  <div class="animate__animated animate__fadeIn" v-loading="loading">
    <el-tabs type="border-card">
      <el-tab-pane>
        <span slot="label"><i class="el-icon-eleme"></i> Element Icon</span>
        <div>
          <element-icon :iconList="iconList"/>
        </div>
      </el-tab-pane>
      <el-tab-pane label="消息中心">
        <span slot="label"><i class="el-icon-sunny"></i> Iconfont Icon</span>
        <div>
          <span>努力💪</span>
          <el-divider direction="vertical"></el-divider>
          <span>奋斗👊</span>
          <el-divider direction="vertical"></el-divider>
          <span>挣大钱💰</span>
        </div>
        <el-button type="success" round style="margin-top: 10px">It's your show time!</el-button>
      </el-tab-pane>
      <el-tab-pane label="角色管理">
        <span slot="label"><i class="el-icon-cloudy"></i> Fontware Icon</span>
        <div>
          <span>楠橘星🌟</span>
          <el-divider direction="vertical"></el-divider>
          <span>简洁版🤩</span>
          <el-divider direction="vertical"></el-divider>
          <span>管理系统💫</span>
        </div>
        <el-button type="primary" round style="margin-top: 10px">It's your show time!</el-button>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import ElementIcon from "./component/ElementIcon";
import {listIcon} from "../../../api/system/icon/IconApi";
import {resultCheck} from "../../../utils/result";


export default {
  name: "Icon",
  components: {
    ElementIcon,
  },
  data() {
    return {
      iconList: [],
      loading: false,
    }
  },
  mounted() {
    this.initData();
  },
  methods: {
    //  初始化数据
    initData() {
      this.loading = true;
      listIcon().then(res => {
        this.iconList = resultCheck(res, false);
        this.loading = false;
      });
    },
  }
}
</script>

<style scoped>

</style>