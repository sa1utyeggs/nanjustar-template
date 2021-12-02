<template>
  <div class="animate__animated animate__fadeIn">
    <el-card>
      <div class="search-container">
        <el-popconfirm
            confirm-button-text='确定'
            cancel-button-text='取消'
            icon="el-icon-info"
            icon-color="red"
            @confirm="deleteLogsInfo"
            title="确定要批量删除这些内日志信息吗？"
        >
          <el-button :disabled="deleteList.length === 0" slot="reference" icon="el-icon-delete" type="danger"
                     size="small">批量删除
          </el-button>
        </el-popconfirm>
        <div class="search-box">
          <el-input prefix-icon="el-icon-search" v-model="searchCondition.optLogName" placeholder="请输入操作模块名称..." size="small" style="margin-right: 10px"/>
          <el-button icon="el-icon-search" type="primary" size="small" @click="initData">搜索</el-button>
        </div>
      </div>
      <el-table
          v-loading="loading"
          :data="optLogList"
          style="width: 100%;margin-top: 20px"
          @selection-change="selectionChange">
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
        <el-table-column type="expand">
          <template slot-scope="scope">
            <div class="main-container">
              <div class="opt">
                <div>
                  <span class="title">操作模块：</span>
                  <span class="content">{{ scope.row.title }}</span>
                </div>
                <div>
                  <span class="title">请求地址：</span>
                  <span class="content">{{ scope.row.optUrl }}</span>
                </div>
              </div>
              <div class="request">
                <div>
                  <span class="title">请求方式：</span>
                  <span class="content">{{ scope.row.requestType }}</span>
                </div>
                <div>
                  <span class="title">操作时间：</span>
                  <span class="content">{{ scope.row.optTime }}</span>
                </div>
              </div>
              <div class="requestParam">
                <span class="title">请求参数：</span>
                <span class="content">{{ scope.row.requestParam }}</span>
              </div>
              <div class="response">
                <span class="title">返回参数：</span>
                <span class="content">{{ scope.row.responseData }}</span>
              </div>
              <div class="time">
                <span class="title">操作员：</span>
                <span class="content">{{ scope.row.optName }}</span>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column
            width="110"
            label="操作模块"
            prop="title">
        </el-table-column>
        <el-table-column
            align="center"
            width="50"
            label="类型"
            prop="businessType">
        </el-table-column>
        <el-table-column
            align="center"
            min-width="130"
            label="方法描述"
            prop="methodName">
        </el-table-column>
        <el-table-column
            align="center"
            width="90"
            label="请求方式"
            prop="requestType">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.requestType === 'GET'" type="success">GET</el-tag>
            <el-tag v-if="scope.row.requestType === 'POST'" type="success">POST</el-tag>
            <el-tag v-if="scope.row.requestType === 'PUT'" type="primary">PUT</el-tag>
            <el-tag v-if="scope.row.requestType === 'DELETE'" type="danger">DELETE</el-tag>
          </template>
        </el-table-column>
        <el-table-column
            align="center"
            min-width="140"
            label="操作员"
            prop="optName">
        </el-table-column>
        <el-table-column
            align="center"
            width="125"
            label="操作员ip"
            prop="optIp">
        </el-table-column>
        <el-table-column
            align="center"
            min-width="140"
            label="操作员地址"
            prop="optAddress">
        </el-table-column>
        <el-table-column
            align="center"
            width="180"
            label="操作日期"
            prop="optTime">
          <template slot-scope="scope">
            <i class="el-icon-time"/>{{ scope.row.optTime }}
          </template>
        </el-table-column>
        <el-table-column
            align="center"
            width="80"
            label="操作">
          <template slot-scope="scope">
            <el-popconfirm
                title="确定要删除本条日志信息吗？"
                @confirm="deleteLogInfo(scope.row.optId)">
              <el-button
                  type="warning"
                  size="mini"
                  slot="reference"
                  plain>
                删除
              </el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
          class="page"
          @size-change="sizeChange"
          @current-change="currentChange"
          :current-page="current"
          :page-sizes="[8, 16, 32]"
          :page-size="8"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </el-card>
  </div>
</template>

<script>
import {deleteLog, deleteLogList, listOptLog} from "../../../api/log/optlog/logApi";
import {resultCheck} from "../../../utils/result";

export default {
  name: "OptLog",
  data() {
    return {
      optLogList: [],
      deleteList: [],
      total: 0,
      loading: false,
      current: 1,
      searchCondition: {
        current: 1,
        size: 8,
        optLogName: ""
      },
    }
  },
  mounted() {
    this.initData();
  },
  methods: {
    //=======================  查询操作  ===========================
    // 初始化数据
    initData() {
      this.loading = true;
      listOptLog(this.searchCondition).then(res => {
        this.optLogList = res.data.data;
        this.total = res.data.total;
        this.loading = false;
      });
    },
    //  批量删除id获取
    selectionChange(val) {
      val.forEach(item => {
        this.deleteList.push(item.optId);
      })
    },
    //  每页条数发生变化
    sizeChange(size) {
      this.searchCondition.size = size;
      this.initData();
    },
    //  当前页发生变化
    currentChange(current) {
      this.searchCondition.current = current;
      this.current = current;
      this.initData();
    },
    //=======================  删除操作  ===========================
    //  删除日志信息
    deleteLogInfo(id) {
      deleteLog(id).then(res => {
        resultCheck(res, true);
        this.initData();
      });
    },
    //  批量删除日志信息
    deleteLogsInfo() {
      deleteLogList(this.deleteList).then(res => {
        resultCheck(res, true);
        this.initData();
      });
    }
  }
}
</script>

<style scoped>
.search-container {
  display: flex;
  justify-content: space-between;
}

.search-box {
  display: flex;
  justify-content: right;
}


.main-container {
  margin-left: 100px;
  width: 85%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.opt {
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
}

.request {
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
}

.requestParam{
  margin-top: 10px;
  display: flex;
  justify-content: left;
}

.response {
  margin-top: 10px;
  display: flex;
  justify-content: left;
}

.time {
  margin-top: 10px;
  display: flex;
  justify-content: right;
}

.title {
  white-space : nowrap;
  font-size: 14px;
  font-weight: bolder;
  color: #333416;
}

.page {
  margin-top: 10px;
  display: flex;
  justify-content: right;
}
</style>