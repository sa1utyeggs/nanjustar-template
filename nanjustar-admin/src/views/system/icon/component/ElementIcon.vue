<template>
  <div class="main-container">
    <el-col :span="3" v-for="(item,index) in iconList" :key="index">
      <div class="icon-box" @click="copy" :data-clipboard-text="item.dictCode">
        <i :class="item.dictCode+ ' icon-i'"></i>
        <div>
          <span class="icon-span">{{ item.dictCode }}</span>
        </div>
      </div>
    </el-col>
  </div>
</template>

<script>

import Clipboard from 'clipboard';
import {messageInfo} from "../../../../utils/MessageInfo";

export default {
  name: "ElementIcon",
  props: ['iconList'],
  data() {
    return {
      message: "",
    }
  },
  methods: {
    copy() {
      var clipboard = new Clipboard('.icon-box')
      clipboard.on('success', e => {
        messageInfo({message: "复制成功！"});
        // 释放内存
        clipboard.destroy()
      });

    }
  }
}
</script>

<style scoped>
.icon-box {
  padding: 30px 10px;
  text-align: center;
  cursor: pointer;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.icon-box:hover{
  color: #70b2f8;
}

.icon-i {
  font-size: 30px;
  margin-bottom: 15px;
}


.icon-span {
  color: #858181;
  font-size: 14px;
}

.icon-span:hover{
  color: #70b2f8;
}
</style>