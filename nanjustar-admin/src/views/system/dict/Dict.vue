<template>
  <div>Dict</div>
</template>

<script>
import {listDictListById, listParentDict} from "../../../api/system/dict/DictApi";
import {resultCheck} from "../../../utils/result";

export default {
  data() {
    return {
      loading: false,
      //=======================  数据存储  ===========================
      dictParentList: [],                      //数据字典父级存储

    }
  },
  mounted() {
    this.initData();
  },
  methods: {
    //=======================  查询操作  ===========================
    //  初始化数据
    initData() {
      this.loading = true;
      listParentDict().then(res => {
        this.dictParentList = resultCheck(res, false);
        this.loading = false;
      })
    },

    //=======================  表格数据  ===========================
    loadDict(tree, treeNode, resolve) {
      listDictListById(tree.dictId).then(res => {
        resolve(res.data);
      });
    }
  }
}
</script>

<style>
.search-container {
  display: flex;
  justify-content: right;
}

.el-button--text {
  color: #80b0f2;
  font-size: 13px;
}
</style>