<!--流程设计界面-->
<template>
  <div>
    <div id="flowPanel"></div>

    <!-- 节点属性设置 -->
    <el-dialog
      class="dialog-mini"
      width="650px"
      v-el-drag-dialog
      :title="nodeTemp.name"
      :visible.sync="dialogFormVisible"
    >
      <el-form :rules="rules" ref="dataForm" :model="nodeTemp" label-width="100px">
        <el-form-item size="small" :label="'Id'" prop="id">
          <el-input v-model="nodeTemp.id" style="width: 200px;" readonly disabled></el-input>
        </el-form-item>

        <el-form-item size="small" :label="'名称'" prop="name">
          <el-input v-model="nodeTemp.name"></el-input>
        </el-form-item>
        <el-form-item size="small" :label="'三方回调URL'" prop="ThirdPartyUrl">
          <el-input v-model="nodeTemp.setInfo.ThirdPartyUrl"></el-input>
        </el-form-item>

        <el-form-item size="small" :label="'执行权限'" prop="NodeDesignate">
          <el-select
            class="filter-item"
            style="width:100%"
            v-model="nodeTemp.setInfo.NodeDesignate"
            placeholder="请选择"
            :popper-append-to-body="false"
          >
            <el-option
              v-for="item in  NodeDesignates"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item
          size="small"
          :label="'指定用户'"
          v-if="nodeTemp.setInfo.NodeDesignate ==='SPECIAL_USER'"
          prop="NodeDesignateUsers"
        >
          <select-users
            :users="nodeTemp.setInfo.NodeDesignateData.users"
            v-on:users-change="usersChange"
          ></select-users>
        </el-form-item>

         <el-form-item
          size="small"
          :label="'指定角色'"
          v-if="nodeTemp.setInfo.NodeDesignate ==='SPECIAL_ROLE'"
          prop="NodeDesignateUsers"
        >
          <select-roles
            :roles="nodeTemp.setInfo.NodeDesignateData.roles"
            v-on:roles-change="rolesChange"
          ></select-roles>
        </el-form-item>

        <el-form-item
          size="small"
          :label="'会签类型'"
          v-if="nodeTemp.type=='fork'"
          prop="NodeConfluenceType"
        >
          <el-select
            class="filter-item"
            v-model="nodeTemp.setInfo.NodeConfluenceType"
            placeholder="请选择"
            :popper-append-to-body="false"
          >
            <el-option
              v-for="item in  NodeConfluenceTypes"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        
        <el-form-item size="small" :label="'可否修改表单'" prop="ThirdPartyUrl">
          <el-input v-model="nodeTemp.setInfo.ThirdPartyUrl"></el-input>
        </el-form-item>
      </el-form>
      
      <div slot="footer">
        <el-button size="small" slot="footer" @click="dialogFormVisible = false">取消</el-button>
        <el-button size="small" slot="footer" type="primary" @click="updateData">确认</el-button>
      </div>
    </el-dialog>

    <!-- 线属性设置 -->
    <el-dialog
      class="dialog-mini"
      width="650px"
      v-el-drag-dialog
      :title="lineTemp.from +'-->' +lineTemp.to"
      :visible.sync="dialogLineVisible"
    >
      <el-form :inline="true" :rules="rules" ref="dataLine" :model="lineTemp" label-width="100px">
        <!-- 条件分支 -->
        <div v-for="(compare, index) in lineTemp.Compares" :key="index">
          <el-form-item size="small" label="表单字段条件">
            <el-select :popper-append-to-body="false" v-model="compare.FieldName" style="width: 150px;" placeholder="请选择">
              <el-option
                v-for="item in  formTemplate"
                :key="item.name"
                :label="item.title"
                :value="item.name"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item size="small">
            <el-select :popper-append-to-body="false" v-model="compare.Operation" style="width: 80px;" placeholder="请选择">
              <el-option label=">" value=">"></el-option>
              <el-option label=">=" value=">="></el-option>
              <el-option label="<" value="<"></el-option>
              <el-option label="<=" value="<="></el-option>
              <el-option label="=" value="="></el-option>
              <el-option label="!=" value="!="></el-option>
            </el-select>
          </el-form-item>
          <el-form-item size="small">
            <el-input v-model="compare.Value" style="width: 150px;" placeholder="值"></el-input>
          </el-form-item>
          <el-form-item size="small">
            <el-button
              type="primary"
              size="mini"
              icon="el-icon-plus"
              v-if="index === 0"
              @click="btnAddCompare"
            >并且</el-button>
            <el-button
              type="danger"
              size="mini"
              icon="el-icon-delete"
              v-if="index != 0"
              @click="btnDelCompare(index)"
            >删除</el-button>
          </el-form-item>
        </div>
      </el-form>
      <div slot="footer">
        <el-button size="small" slot="footer" @click="dialogLineVisible = false">取消</el-button>
        <el-button size="small" slot="footer" type="primary" @click="updateLine">确认</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import 'jquery'
import './flowlayout'
import '@/assets/flow/GooFlow.css'
import elDragDialog from '@/directive/el-dragDialog'
import SelectUsers from '@/components/SelectUsers'
import SelectRoles from '@/components/SelectRoles'

export default {
  name: 'flow-editor',
  components: { SelectUsers, SelectRoles },
  props: {
    schemeContent: String,
    formTemplate: null,
    isEdit: Boolean,
    isPreview: Boolean
  },
  directives: {
    elDragDialog
  },
  data() {
    return {
      orgs: [], // treeselect选择中的部门
      flowDesignPanel: null,
      dialogFormVisible: false,
      dialogLineVisible: false,
      NodeConfluenceTypes: [
        { id: 'all', name: '全部通过' },
        { id: 'one', name: '至少一个通过' }
      ],
      NodeDesignates: [
        { id: 'SPECIAL_USER', name: '指定用户' },
        { id: 'ALL_USER', name: '所有人' },
        { id: 'SPECIAL_ROLE', name: '指定角色' }
      ],
      NodeRejectTypes: [
        { id: '0', name: '前一步' },
        { id: '1', name: '第一步' },
        { id: '2', name: '某一步' },
        { id: '3', name: '用户指定' },
        { id: '4', name: '不处理' }
      ],
      nodeTemp: {
        // 节点设置信息
        id: undefined,
        name: '',
        type: '',
        setInfo: {
          NodeRejectType: 0, // 驳回类型
          NodeConfluenceType: '', // 会签方式
          NodeDesignate: '', // 节点权限方式
          ThirdPartyUrl: '', // 三方回调URL
          NodeDesignateData: {
            // 节点指定操作人
            users: [],
            roles: []
          }
        }
      },
      lineTemp: {
        // 线段的设置项
        Compares: [] // 分支条件
      },
      rules: {
        name: [{ required: true, message: '名称不能为空', trigger: 'blur' }]
      }
    }
  },
  mounted() {
    var _this = this // 记录vuecomponent
    this.flowDesignPanel = $('#flowPanel').flowdesign({
      height: '600',
      haveTool: !_this.isPreview,
      OpenNode: function(obj) {
        if (obj.type === 'start round mix' || obj.type === 'end round') {
          alert('开始节点与结束节点不能设置')
          return false
        }

        _this.resetTemp()
        _this.nodeTemp = Object.assign(_this.nodeTemp, obj) // copy obj
        _this.dialogFormVisible = true
        _this.$nextTick(() => {
          _this.$refs['dataForm'].clearValidate()
        })
      },
      OpenLine: function(obj) {
        _this.resetLineTmp()
        _this.lineTemp = Object.assign(_this.lineTemp, obj) // copy obj
        _this.dialogLineVisible = true
        _this.$nextTick(() => {
          _this.$refs['dataLine'].clearValidate()
        })
      }
    })
  },

  watch: {
    schemeContent(val) {
      if (val !== undefined && val !== '-1') {
        this.flowDesignPanel.loadData(JSON.parse(val))
      }
    }
  },

  methods: {
    resetLineTmp() {
      this.lineTemp = {
        Compares: [] // 分支条件
      }
      this.btnAddCompare()
    },
    resetTemp() {
      this.nodeTemp = {
        id: undefined,
        name: '',
        type: 'node',
        setInfo: {
          NodeConfluenceType: 'all', // 会签方式
          NodeDesignate: 'ALL_USER', // 节点权限方式
          ThirdPartyUrl: '',
          NodeDesignateData: {
            // 节点指定操作人
            users: [],
            roles: []
          }
        }
      }
    },
    btnAddCompare() {
      this.lineTemp.Compares.push({
        FieldName: '',
        Operation: '',
        Value: ''
      })
    },
    btnDelCompare(e) {
      this.lineTemp.Compares.splice(e, 1)
    },
    updateData() {
      // 更新提交
      this.$refs['dataForm'].validate(valid => {
        if (valid) {
          // const tempData = Object.assign({}, this.nodeTemp)
          // 设置节点的附加信息
          this.flowDesignPanel.SetNodeEx(this.nodeTemp.id, this.nodeTemp)
          this.dialogFormVisible = false
        }
      })
    },
    updateLine() {
      // 更新线段属性
      this.$refs['dataLine'].validate(valid => {
        if (valid) {
          this.flowDesignPanel.setLine(this.lineTemp.id, this.lineTemp)
          this.dialogLineVisible = false
        }
      })
    },
    usersChange(users) {
      // 可执行用户
      this.nodeTemp.setInfo.NodeDesignateData.users = users
    },
    rolesChange(roles) {
      // 可执行用户
      this.nodeTemp.setInfo.NodeDesignateData.roles = roles
    },
    getSchemeContent() {
      var content = this.flowDesignPanel.exportDataEx()

      return JSON.stringify(content)
    }
  }
}
</script>

<style>
#draw_flowPanel {
  width: 100vw;
}
.GooFlow .item_round table {
  padding: 10px;
}
.GooFlow table {
  padding: 6px 10px;
  border-radius: 2px;
}
.GooFlow div .rs_close {
  right: -6px;
  top: 2px;
  width: 20px;
  height: 20px;
  font-size: 16px;
  color: red;
}
</style>
