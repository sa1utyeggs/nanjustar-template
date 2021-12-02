<template>
  <div class="animate__animated animate__fadeIn">
    <el-card>
      <!--查询部分-->
      <div class="top-container">
        <!--搜索部分-->
        <div class="search-container" v-show="searchShow">
          <el-input
              style="width: 25%;margin-right: 10px"
              placeholder="请输入菜单名称..."
              size="small"
              prefix-icon="el-icon-search"
              clearable
              @clear="clearMenuName"
              v-model="searchCondition.menuName">
          </el-input>
          <el-select v-model="searchCondition.isDisable"
                     clearable
                     size="small"
                     @clear="clearMenuStatus"
                     placeholder="请选择菜单状态">
            <el-option :key=true label="禁用" :value="true"/>
            <el-option :key="false" label="正常" :value="false"/>
          </el-select>
          <el-button type="primary"
                     size="small"
                     icon="el-icon-search"
                     @click="searchMenu"
                     style="margin-left: 10px">搜索
          </el-button>
        </div>
        <!--添加部分-->
        <div class="save-container">
          <!--添加-->
          <div class="save-box">
            <el-button type="primary" size="small" plain icon="el-icon-plus" @click="saveMenuVisible = true">添加菜单
            </el-button>
          </div>
          <!--关闭-->
          <div class="close-box">
            <el-tooltip content="关闭查询" placement="bottom">
              <el-button type="primary" size="small" plain circle icon="el-icon-search"
                         @click="searchShow = !searchShow"/>
            </el-tooltip>
            <el-tooltip content="刷新数据" placement="bottom">
              <el-button type="success" size="small" plain circle icon="el-icon-refresh" @click="initData"/>
            </el-tooltip>
            <el-tooltip content="显隐列" placement="bottom">
              <el-button type="warning" size="small" plain circle icon="el-icon-menu" @click="transferVisible = true"/>
            </el-tooltip>
          </div>
        </div>
      </div>
      <!--数据部分-->
      <el-table
          ref="MenuTable"
          :data="menuList"
          style="width: 100%;margin-top: 10px"
          row-key="menuId"
          lazy
          highlight-current-row
          v-loading="loading"
          :load="loadChildren"
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
        <el-table-column
            v-if="!transferValue.includes('菜单名称')"
            prop="menuName"
            label="菜单名称"
            width="120">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('图标')"
            align="center"
            label="图标"
            width="50">
          <template slot-scope="scope">
            <el-icon :class="scope.row.icon"/>
          </template>
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('排序')"
            align="center"
            prop="orderNum"
            width="50"
            label="排序">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('路由地址')"
            align="center"
            prop="path"
            width="170"
            label="路由地址">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('组件名称')"
            align="center"
            prop="component"
            min-width="200"
            label="组件名称">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('隐藏')"
            align="center"
            width="70"
            label="隐藏">
          <template slot-scope="scope">
            <el-tag :type="scope.row.isHidden?'warning':'success'">
              {{ scope.row.isHidden ? '隐藏' : '显示' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('禁用')"
            width="70"
            align="center"
            label="禁用">
          <template slot-scope="scope">
            <el-switch type="primary" v-model="scope.row.isDisable" active-color="#13ce66"/>
          </template>
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('创建人')"
            min-width="140"
            align="center"
            prop="createBy"
            label="创建人">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('创建时间')"
            align="center"
            width="180"
            label="创建时间">
          <template slot-scope="scope">
            <el-icon class="el-icon-time"/>
            {{ scope.row.gmtCreate }}
          </template>
        </el-table-column>
        <el-table-column
            align="center"
            v-if="!transferValue.includes('修改人')"
            prop="updateBy"
            min-width="140"
            label="修改人">
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('修改时间')"
            align="center"
            width="180"
            label="修改时间">
          <template slot-scope="scope">
            <el-icon class="el-icon-time"/>
            {{ scope.row.gmtUpdate }}
          </template>
        </el-table-column>
        <el-table-column
            v-if="!transferValue.includes('备注信息')"
            align="center"
            prop="remark"
            min-width="180"
            label="备注信息">
        </el-table-column>
        <el-table-column
            align="center"
            min-width="179px"
            label="操作">
          <template slot-scope="scope">
            <el-button type="text" icon="el-icon-edit" @click="toUpdate(scope.row)">修改</el-button>
            <el-button type="text" icon="el-icon-plus" v-show="scope.row.component ==='Layout'"
                       @click="toSave(scope.row.menuId)">新增
            </el-button>
            <el-button type="text" icon="el-icon-delete" @click="deleteMenu(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!--显隐列 弹出层-->
    <el-dialog
        title="显隐列设置"
        :visible.sync="transferVisible"
        width="45%"
        append-to-body
        center>
      <el-transfer
          v-model="transferValue"
          :data="transferData"
          :titles="transferTitles">
      </el-transfer>
    </el-dialog>
    <!--新增 弹出层-->
    <el-drawer
        :title="menuForm.menuId === -1?'新增菜单/目录信息':'修改菜单/目录信息'"
        :visible.sync="saveMenuVisible"
        append-to-body
        direction="rtl"
        size="28%"
        :before-close="leave">
      <div class="save-container">
        <el-form ref="menuFormCheck" :rules="rule" :model="menuForm" label-width="90px" class="demo-ruleForm">
          <el-form-item label="菜单类型" v-if="menuForm.menuId === -1">
            <el-radio v-model="menuType" border size="small" label="menu">一级菜单</el-radio>
            <el-radio v-model="menuType" border size="small" label="content">一级目录</el-radio>
          </el-form-item>
          <el-form-item label="菜单名称" prop="menuName">
            <el-input v-model="menuForm.menuName" border label="menu"
                      placeholder="请输入菜单名称..."/>
          </el-form-item>
          <el-form-item label="菜单路由" prop="path">
            <el-input v-model="menuForm.path" border label="menu" placeholder="请输入菜单路由..."/>
          </el-form-item>
          <el-form-item label="菜单组件" prop="component">
            <el-input v-model="menuType==='menu'?'Layout':menuForm.component" :disabled="menuType === 'menu'" border
                      label="menu" placeholder="请输入菜单组件..."/>
          </el-form-item>
          <el-form-item label="菜单图标" prop="icon" style="width: 105%">
            <el-autocomplete
                style="width: 100%"
                :prefix-icon="menuForm.icon"
                v-model="menuForm.icon"
                :fetch-suggestions="querySearch"
                value-key="dictCode"
                value="dictCode"
                placeholder="请选择图标...">
              <template slot-scope="{ item }">
                <div style="display: flex;justify-content: left;font-size: 15px;line-height: 35px">
                  <el-icon :class="item.dictCode" style="margin-right: 10px;line-height: 35px"/>
                  <span>{{ item.dictCode }}</span>
                </div>
              </template>
            </el-autocomplete>
          </el-form-item>
          <el-form-item label="菜单排序">
            <el-input-number size="small" v-model="menuForm.orderNum"/>
          </el-form-item>
          <el-form-item label="菜单隐藏">
            <el-switch v-model="menuForm.isHidden" active-color="#13ce66"/>
          </el-form-item>
          <el-form-item label="备注信息" align="center">
            <el-input type="textarea" :rows="3" placeholder="请输入备注信息..." v-model="menuForm.remark"/>
          </el-form-item>
          <el-form-item align="center">
            <el-button icon="el-icon-sunny" size="small" type="success" plain @click="saveMenuContent('menuFormCheck')">
              确定
            </el-button>
            <el-popconfirm
                v-if="menuForm.menuId === -1"
                style="margin-left: 10px"
                title="确定要重置菜单信息吗？"
                @confirm="clearForm">
              <el-button icon="el-icon-refresh" size="small" type="warning" plain slot="reference">重置</el-button>
            </el-popconfirm>
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>
  </div>
</template>

<script>
import {messageInfo} from "@/utils/MessageInfo";
import {transferTitles, transferData} from "@/assets/const/menu";
import {
  listMenuByCondition,
  listMenuParent,
  listMenuChildren,
  deleteMenuById,
  saveMenu,
  updateMenu
} from "../../../api/menu/permApi";
import {resultCheck} from "../../../utils/result";
import {initMenu} from "../../../utils/menu";
import {listIcon} from "../../../api/system/icon/IconApi";

export default {
  name: 'Menu',
  data() {
    return {
      //=======================  表单信息  ===========================
      iconList: [],        //图标列表
      menuList: [],       //表单数据
      loading: true,      //表单加载
      searchShow: true,   //查询功能是否开启
      searchCondition: {   //查询条件
        menuName: '',
        isDisable: '',
      },
      //=======================  穿梭表单  ===========================
      transferTitles: transferTitles(),  //穿梭表单title
      transferValue: ['创建人', '修改人', '修改时间', '备注信息'],               //穿梭表单选中数据
      transferData: transferData(),      //穿梭表单数据
      transferVisible: false,            //显隐列是否开启
      //=======================  菜单  ===========================
      saveMenuVisible: false,   //新增菜单
      menuType: "menu",
      rule: {
        menuName: [{required: true, message: '菜单名称不能为空！', trigger: 'blur'}],
        path: [{required: true, message: '菜单路由不能为空！', trigger: 'blur'}],
        component: [{required: true, message: '菜单组件不能为空！', trigger: 'blur'}],
        icon: [{required: true, message: '菜单图标不能为空！', trigger: 'blur'}],
      },
      menuForm: {
        menuId: -1,
        menuName: '',
        path: '',
        component: 'Layout',
        icon: '',
        orderNum: 99,
        parentId: -1,
        isHidden: false,
        remark: ''
      }
    }
  },
  mounted() {
    this.initData();
    this.initIcon();
  },
  methods: {
    //=======================  查询菜单部分  ===========================
    initData() {
      this.loading = true;
      listMenuParent().then(res => {
        if (res.status) {
          this.menuList = res.data;
        } else {
          messageInfo({type: "error", message: res.message});
        }
        this.loading = false;
      });
    },
    //  查询图标列表
    initIcon() {
      listIcon().then(res => {
        this.iconList = resultCheck(res);
      });
    },
    //  查询菜单信息
    searchMenu() {
      if (this.searchCondition.menuName !== '') {
        listMenuByCondition(this.searchCondition).then(res => {
          this.menuList = resultCheck(res, true);
        });
      } else {
        messageInfo({type: 'warning', message: '菜单名称不能为空哦！'});
      }
    },
    // 清空菜单状态
    clearMenuStatus() {
      this.initData();
    },
    //  清空菜单名称
    clearMenuName() {
      this.initData();
    },
    //  加载子级菜单信息
    loadChildren(node, treeNode, resolve) {
      listMenuChildren(node.menuId).then(res => {
        resolve(resultCheck(res,false));
      });
    },
    //  查询图标
    querySearch(queryString, cb) {
      var iconList = this.iconList;
      var results = queryString ? iconList.filter(this.createStateFilter(queryString)) : iconList;
      cb(results);
    },
    createStateFilter(queryString) {
      return (state) => {
        return (state.dictCode.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    //=======================   删除菜单信息  ===========================
    deleteMenu(data) {
      this.$confirm(`确认要删除名称为： <strong>${data.menuName}</strong> 的菜单信息吗？`, {
        type: 'warning',
        dangerouslyUseHTMLString: true
      }).then(_ => {
        deleteMenuById(data.menuId).then(res => {
          resultCheck(res, true);
          this.initData();
          initMenu(this.$router, this.$store);
        });
      });
    },
    //=======================  新增/修改菜单部分  ===========================
    leave() {
      this.$confirm('数据不会临时保存，切勿离开此界面！')
          .then(_ => {
            this.menuForm = {menuId: -1};
            this.saveMenuVisible = false;
          });
    },
    //  清空表单信息
    clearForm() {
      this.menuForm = {menuId: -1};
    },
    //  跳转至修改界面
    toUpdate(data) {
      this.menuForm = data;
      if (data.component === 'Layout') {
        this.menuType = 'menu';
        this.menuForm.component = data.component;
      } else {
        this.menuType = 'content';
      }
      this.saveMenuVisible = true;
    },
    //  跳转至新增界面
    toSave(menuId) {
      this.menuForm.menuId = -1;
      this.menuForm.parentId = menuId;
      this.menuType = 'content';
      this.saveMenuVisible = true;
    },
    //  添加菜单/目录信息
    saveMenuContent(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.menuForm.menuId === -1) {
            if (this.menuType === 'menu') {
              this.menuForm.component = 'Layout';
              saveMenu(this.menuForm).then(res => {
                resultCheck(res, true);
              });
            } else if (this.menuType === 'content') {
              saveMenu(this.menuForm).then(res => {
                resultCheck(res, true);
              });
            }
          } else {
            updateMenu(this.menuForm).then(res => {
              resultCheck(res, true);
            });
          }
          this.initData();
          this.saveMenuVisible = false;
        }
      });
    },
  }
}
</script>

<style>
.top-container {
  width: 100%;
}

.search-container {
  width: 100%;
  display: flex;
  justify-content: left;
}

.save-container {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}

.el-button--text {
  color: #70b2f8;
  font-size: 12px;
}
</style>