<template>
<div>
  <sticky :className="'sub-navbar'">
    <div class="filter-container">
      <el-input @keyup.enter.native="handleFilter" size="mini"  style="width: 200px;" class="filter-item" :placeholder="'名称'" v-model="listQuery.key">
      </el-input>
      
      <el-button class="filter-item" size="mini"  v-waves icon="el-icon-search" @click="handleFilter">搜索</el-button>
      <permission-btn moduleName='categories' size="mini" v-on:btn-event="onBtnClicked"></permission-btn>
    </div>
     </sticky>
      <div class="app-container ">
		 
     <div class="bg-white">
    <el-table  ref="mainTable"  :key='tableKey' :data="list" v-loading="listLoading" border fit highlight-current-row
      style="width: 100%;" @row-click="rowClick"  @selection-change="handleSelectionChange">
			
       <el-table-column type="selection" align="center"  width="55"></el-table-column>
 <template v-for="(headerItem,index) in headerList">
          <el-table-column  :label="headerItem.description" min-width="120px" :key="index">
            <template slot-scope="scope">
              <span>{{scope.row[headerItem.key]}}</span>
            </template>
          </el-table-column>
      </template>

      <el-table-column align="center" :label="'操作'" width="230" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button  type="primary" size="mini" @click="handleUpdate(scope.row)">编辑</el-button>
       </template>
      </el-table-column>
    </el-table>
		<pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="handleCurrentChange" />
	</div>

    <el-dialog v-el-drag-dialog   class="dialog-mini" width="500px" :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form :rules="rules" ref="dataForm" :model="temp" label-position="right" label-width="100px">
      
            
              <el-form-item size="small" :label="'分类表ID（可作为分类的标识）'" prop="id">
                <el-input v-model="temp.id"></el-input>
              </el-form-item>
            
              <el-form-item size="small" :label="'名称'" prop="name">
                <el-input v-model="temp.name"></el-input>
              </el-form-item>
            
              <el-form-item size="small" :label="'是否可用'" prop="disabled">
                 <el-select class="filter-item" v-model="temp.disabled" placeholder="Please select">
                 <el-option v-for="item in  statusOptions" :key="item.key" :label="item.display_name" :value="item.key">
                </el-option>
              </el-select>
              </el-form-item>
            
            <el-form-item size="small" :label="'排序号'">
              <el-input v-model="temp.sortNo"></el-input>
            </el-form-item>
            
              <el-form-item size="small" :label="'分类图标'" prop="icon">
                <el-input v-model="temp.icon"></el-input>
              </el-form-item>
            
              <el-form-item size="small" :label="'分类描述'" prop="description">
                <el-input v-model="temp.description"></el-input>
              </el-form-item>
            
              <el-form-item size="small" :label="'分类类型ID'" prop="typeId">
                <el-input v-model="temp.typeId"></el-input>
              </el-form-item>
      </el-form>
      <div slot="footer" >
        <el-button size="mini" @click="dialogFormVisible = false">取消</el-button>
        <el-button size="mini" v-if="dialogStatus=='create'" type="primary" @click="createData">确认</el-button>
        <el-button size="mini" v-else type="primary" @click="updateData">确认</el-button>
      </div>
    </el-dialog>
  </div>
</div>
 
</template>

<script>
import * as categorys from '@/api/categorys'
import waves from '@/directive/waves' // 水波纹指令
import Sticky from '@/components/Sticky'
import permissionBtn from '@/components/PermissionBtn'
import Pagination from '@/components/Pagination'
import elDragDialog from '@/directive/el-dragDialog'
export default {
  name: 'categorys',
  components: { Sticky, permissionBtn, Pagination },
  directives: {
    waves,
    elDragDialog
  },
  data() {
    return {
      multipleSelection: [], // 列表checkbox选中的值
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: { // 查询条件
        page: 1,
        limit: 20,
        key: undefined,
        appId: undefined
      },
      statusOptions: [
        { key: true, display_name: '停用' },
        { key: false, display_name: '正常' }
      ],
      temp: {
        id: '', // 分类表ID（可作为分类的标识）
        name: '', // 名称
        disabled: '', // 是否可用
        sortNo: '', // 排序号
        icon: '', // 分类图标
        description: '', // 分类描述
        typeId: '', // 分类类型ID
        extendInfo: '' // 其他信息,防止最后加逗号，可以删除
      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑',
        create: '添加'
      },
      dialogPvVisible: false,
      pvData: [],
      rules: {
        appId: [{ required: true, message: '必须选择一个应用', trigger: 'change' }],
        name: [{ required: true, message: '名称不能为空', trigger: 'blur' }]
      },
      downloadLoading: false,
      headerList: []
    }
  },
  filters: {
    statusFilter(disable) {
      const statusMap = {
        false: 'color-success',
        true: 'color-danger'
      }
      return statusMap[disable]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    rowClick(row) {
      this.$refs.mainTable.clearSelection()
      this.$refs.mainTable.toggleRowSelection(row)
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    onBtnClicked: function(domId) {
      console.log('you click:' + domId)
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
        default:
          break
      }
    },
    getList() {
      this.listLoading = true
      categorys.getList(this.listQuery).then(response => {
        response.columnHeaders.forEach((item) => {
          item.key = item.key.substring(0, 1).toLowerCase() + item.key.substring(1)
          console.log(item.key)
        })
        this.headerList = response.columnHeaders
        this.list = response.data
        this.total = response.count
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
    resetTemp() {
      this.temp = {
        id: '',
        name: '',
        disabled: '',
        sortNo: '',
        icon: '',
        description: '',
        typeId: '',
        extendInfo: ''
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
          categorys.add(this.temp).then(() => {
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
          categorys.update(tempData).then(() => {
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
      categorys.del(rows.map(u => u.id)).then(() => {
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
	.dialog-mini .el-select{
		width:100%;
	}
</style>
