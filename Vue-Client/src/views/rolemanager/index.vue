<template>
  <div>
    <sticky :className="'sub-navbar'">
      <div class="filter-container">
        <el-input @keyup.enter.native="handleFilter" prefix-icon="el-icon-search" size="small" style="width: 200px; margin-bottom: 0;"
          class="filter-item" :placeholder="'关键字'" v-model="listQuery.key">
        </el-input>

        <!-- <el-button class="filter-item" type="success"  v-waves icon="el-icon-search" @click="handleFilter">搜索</el-button> -->
        <permission-btn moduleName='rolemanager' size="mini" v-on:btn-event="onBtnClicked"></permission-btn>

        <el-checkbox size="small" style='margin-left:15px;' @change='tableKey=tableKey+1' v-model="showDescription">Id/描述</el-checkbox>
      </div>
    </sticky>
    <div class="app-container">
          <div class="bg-white">
            <el-table ref="mainTable" :key='tableKey' :data="list" v-loading="listLoading" border fit
              highlight-current-row style="width: 100%;min-height:700px;" @row-click="rowClick" @selection-change="handleSelectionChange">
              <el-table-column align="center" type="selection" width="55">
              </el-table-column>

              <el-table-column :label="'Id'" v-if="showDescription" min-width="120px">
                <template slot-scope="scope">
                  <span>{{scope.row.id}}</span>
                </template>
              </el-table-column>

              <el-table-column min-width="50px" :label="'角色名称'">
                <template slot-scope="scope">
                  <span>{{scope.row.name}}</span>
                </template>
              </el-table-column>

              <el-table-column min-width="300px" :label="'用户列表'">
                <template slot-scope="scope">
                  <role-users :role-id="scope.row.id"></role-users>
                </template>
              </el-table-column>

              <el-table-column class-name="status-col" :label="'状态'" width="100">
                <template slot-scope="scope">
                  <span :class="scope.row.status | statusFilter">{{statusOptions.find(u =>u.key ==
                    scope.row.status).display_name}}</span>
                </template>
              </el-table-column>

              <el-table-column align="center" :label="'操作'" width="230" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                  <el-button type="primary" size="mini" @click="handleUpdate(scope.row)">编辑</el-button>
                  <el-button v-if="scope.row.status==0" size="mini" type="danger" @click="handleModifyStatus(scope.row,1)">停用</el-button>
                </template>
              </el-table-column>
            </el-table>
            <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit"
              @pagination="handleCurrentChange" />

            <!-- <div class="pagination-container">
            <el-pagination background @size-change="handleSizeChange" @current-change="handleCurrentChange"
              :current-page="listQuery.page" :page-sizes="[10,20,30, 50]" :page-size="listQuery.limit" layout="total, sizes, prev, pager, next, jumper"
              :total="total">
            </el-pagination>
          </div> -->
          </div>




      <el-dialog width="500px" v-el-drag-dialog class="dialog-mini" :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
        <el-form :rules="rules" ref="dataForm" :model="temp" label-position="right" label-width="100px">
          <el-form-item size="small" :label="'Id'" prop="id" v-show="dialogStatus=='update'">
            <el-input v-model="temp.id" disabled></el-input>
          </el-form-item>
          <el-form-item size="small" :label="'角色名称'" prop="name">
            <el-input v-model="temp.name"></el-input>
          </el-form-item>
          <el-form-item size="small" :label="'状态'">
            <el-select class="filter-item" v-model="temp.status" placeholder="Please select">
              <el-option v-for="item in  statusOptions" :key="item.key" :label="item.display_name" :value="item.key">
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button size="small" @click="dialogFormVisible = false">取消</el-button>
          <el-button size="small" v-if="dialogStatus=='create'" type="primary" @click="createData">确认</el-button>
          <el-button size="small" v-else type="primary" @click="updateData">确认</el-button>
        </div>
      </el-dialog>
      <!--只有这么写dialog，才能正常触发ESC关闭-->
      <el-dialog class="dialog-mini" ref="accessModulesDlg" v-el-drag-dialog :title="'为角色分配模块菜单'" :visible.sync="dialogAccessModules">
        <access-modules ref="accessModules" v-if="dialogAccessModules" :role-id="multipleSelection[0].id" @change-title="changeTitle" @close="dialogAccessModules=false"></access-modules>
      </el-dialog>

      <el-dialog class="dialog-mini" v-el-drag-dialog :title="'为角色分配资源'" :visible.sync="dialogAccessResource">
        <access-resource ref="accessResource" v-if="dialogAccessResource" :role-id="multipleSelection[0].id" @close="dialogAccessResource=false"></access-resource>
      </el-dialog>
    </div>
  </div>

</template>

<script>
  import * as roles from '@/api/roles'
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  import waves from '@/directive/waves' // 水波纹指令
  import Sticky from '@/components/Sticky'
  import RoleUsers from '@/components/RoleUsers'
  import permissionBtn from '@/components/PermissionBtn'
  import accessModules from '@/components/AccessModules'
  import accessResource from './assignRes'
  import Pagination from '@/components/Pagination'
  import elDragDialog from '@/directive/el-dragDialog'

  export default {
    name: 'rolemanager',
    components: {
      RoleUsers,
      Sticky,
      permissionBtn,
      Treeselect,
      accessModules,
      accessResource,
      Pagination
    },
    directives: {
      waves,
      elDragDialog
    },
    data() {
      return {
        defaultProps: { // tree配置项
          children: 'children',
          label: 'label'
        },
        multipleSelection: [], // 列表checkbox选中的值
        tableKey: 0,
        list: null,
        total: 0,
        listLoading: true,
        listQuery: { // 查询条件
          page: 1,
          limit: 20,
          key: undefined
        },
        apps: [],
        statusOptions: [{
          key: 1,
          display_name: '停用'
        },
        {
          key: 0,
          display_name: '正常'
        }
        ],
        showDescription: false,
        temp: {
          id: undefined,
          organizations: '',
          organizationIds: '',
          name: '',
          status: 0
        },
        dialogAccessModules: false, // 角色分配模块对话框
        dialogAccessResource: false, // 分配资源对话框
        dialogFormVisible: false,
        dialogStatus: '',
        textMap: {
          update: '编辑',
          create: '添加'
        },
        dialogPvVisible: false,
        pvData: [],
        rules: {
          name: [{
            required: true,
            message: '账号不能为空',
            trigger: 'blur'
          }]
        },
        downloadLoading: false
      }
    },
    filters: {
      statusFilter(status) {
        var res = 'color-success'
        switch (status) {
          case 1:
            res = 'color-danger'
            break
          default:
            break
        }
        return res
      }
    },
    created() {
      this.getList()
    },
    methods: {
      changeTitle(val) { // 自动调整对话框标题
        this.$refs.accessModulesDlg.title = val
      },
      rowClick(row) {
        this.$refs.mainTable.clearSelection()
        this.$refs.mainTable.toggleRowSelection(row)
      },
      getAllroles() {
        this.getList()
      },
      handleSelectionChange(val) {
        this.multipleSelection = val
      },
      onBtnClicked: function(domId) {
        switch (domId) {
          case 'btnAdd':
            this.handleCreate()
            break
          case 'btnEdit':
            if (this.multipleSelection.length !== 1) {
              this.$message({
                message: '只能选中一个进行编辑',
                type: 'error'
              })
              return
            }
            this.handleUpdate(this.multipleSelection[0])
            break
          case 'btnDel':
            if (this.multipleSelection.length < 1) {
              this.$message({
                message: '至少删除一个',
                type: 'error'
              })
              return
            }
            this.handleDelete(this.multipleSelection)
            break
          case 'btnAccessModule':
            if (this.multipleSelection.length !== 1) {
              this.$message({
                message: '只能选中一个进行编辑',
                type: 'error'
              })
              return
            }

            this.dialogAccessModules = true
            break
          case 'btnAssignReource':
            if (this.multipleSelection.length !== 1) {
              this.$message({
                message: '只能选中一个进行编辑',
                type: 'error'
              })
              return
            }

            this.dialogAccessResource = true
            break
          default:
            break
        }
      },
      getList() {
        this.listLoading = true
        roles.getList(this.listQuery).then(response => {
          this.list = response.result
          this.total = response.result.length
          this.listLoading = false
        })
      },
      handleFilter() {
        this.listQuery.page = 1
        this.getList()
      },
      handleSizeChange(val) {
        this.listQuery.limit = val
        this.getList()
      },
      handleCurrentChange(val) {
        this.listQuery.page = val.page
        this.listQuery.limit = val.limit
        this.getList()
      },
      handleModifyStatus(row, status) { // 模拟修改状态
        this.$message({
          message: '操作成功',
          type: 'success'
        })
        row.status = status
      },
      resetTemp() {
        this.temp = {
          id: undefined,
          organizations: '',
          organizationIds: '',
          name: '',
          status: 0
        }
      },
      handleCreate() { // 弹出添加框
        this.resetTemp()
        this.dialogStatus = 'create'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      },
      createData() { // 保存提交
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            roles.add(this.temp).then((response) => {
              this.temp.id = response.result.id
              this.list.unshift(this.temp)
              this.dialogFormVisible = false
              this.$notify({
                title: '成功',
                message: '创建成功',
                type: 'success',
                duration: 2000
              })
            })
          }
        })
      },
      handleUpdate(row) { // 弹出编辑框
        this.temp = Object.assign({}, row) // copy obj
        this.dialogStatus = 'update'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      },
      updateData() { // 更新提交
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            const tempData = Object.assign({}, this.temp)
            roles.update(tempData).then(() => {
              for (const v of this.list) {
                if (v.id === this.temp.id) {
                  const index = this.list.indexOf(v)
                  this.list.splice(index, 1, this.temp)
                  break
                }
              }
              this.dialogFormVisible = false
              this.$notify({
                title: '成功',
                message: '更新成功',
                type: 'success',
                duration: 2000
              })
            })
          }
        })
      },
      handleDelete(rows) { // 多行删除
        roles.del(rows.map(u => u.id)).then(() => {
          this.$notify({
            title: '成功',
            message: '删除成功',
            type: 'success',
            duration: 2000
          })
          rows.forEach(row => {
            const index = this.list.indexOf(row)
            this.list.splice(index, 1)
          })
        })
      }
    }
  }

</script>

<style>
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }

  .el-card__header {
    padding: 12px 20px;
  }

</style>
