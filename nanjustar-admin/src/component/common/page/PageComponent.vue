<template>
  <el-pagination
      class="page"
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page.sync="currentSize"
      :page-size="size"
      :page-sizes="pageSize"
      :layout="layout"
      :total="total">
  </el-pagination>
</template>

<script>
export default {
  name: "PageComponent",
  props: {
    currentSize: {
      type: [String, Number],
      default: () => 1
    },
    current: {
      type: [String, Number],
      default: () => 1
    },
    size: {
      type: [String, Number],
      default: () => 8
    },
    total: {
      type: [String, Number],
      default: () => 0
    },
    pageSize: {
      type: Array,
      default: () => ([8, 16, 32])
    },
    layout: {
      type: String,
      default: () => "total, sizes, prev, pager, next, jumper"
    },
    initData: {},
  },
  computed:{

  },
  methods: {
    //  每页条数发生变化
    sizeChange(size) {
      this.$emit('size', size);
      this.initData();
    },
    //  当前页发生变化
    currentChange(current) {
      this.$emit('current', current);
      this.initData();
    },
  }
}
</script>

<style scoped>
.page {
  display: flex;
  justify-content: right;
  margin-top: 10px;
}
</style>