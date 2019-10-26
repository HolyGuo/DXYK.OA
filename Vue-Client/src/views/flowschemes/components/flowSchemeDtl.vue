<template>
  <div class="createPost-container">
    <el-form class="form-container" :model="postObj" :rules="rules" ref="postObj">
      <el-steps class="steps" :active="active" finish-status="success">
        <el-step title="基础信息"></el-step>
        <el-step title="选择表单"></el-step>
        <el-step title="流程设计"></el-step>
      </el-steps>
      <!--基础信息-->
      <div class="createPost-main-container basic" v-show="active==0">
        <el-row>
          <el-col :span="12">
            <el-form-item label="标题" label-width="100px" prop="schemeNameRule">
              <el-input name="name" v-model="postObj.schemeName" required style="max-width: 200px;">
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label-width="100px" label="模板编号:">
              <el-input type="text" v-model="postObj.schemeCode" style="max-width: 200px;">
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label-width="100px" label="发布时间:" class="postInfo-container-item">
              <el-date-picker v-model="postObj.createDate" type="datetime" format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label-width="100px" label="重要性(占位):" class="postInfo-container-item">
              <el-rate style="margin-top:8px;" :max='3' :colors="['#99A9BF', '#F7BA2A', '#FF9900']" :low-threshold="1"
                :high-threshold="3">
              </el-rate>
            </el-form-item>
          </el-col>
          <el-col :span="24">

            <el-form-item label-width="100px" label="摘要:">
              <el-input type="textarea" :rows="3" placeholder="请输入内容" v-model="postObj.description">
              </el-input>
              <span class="word-counter" v-if="contentShortLength">{{contentShortLength}}字</span>
            </el-form-item>
          </el-col>
        </el-row>
      </div>

      <div class="createPost-main-container" v-show="active==1">
        <el-tabs type="border-card" v-model="postObj.frmId" @tab-click="handleTabClick">
          <template v-for="item in forms">
            <el-tab-pane :label="item.name" :name="item.id" :id="item.id" :key="item.id">
              <el-card class="box-card" v-if="item.frmType == 1">
                <component v-bind:is="item.webId +'Add'"></component>
              </el-card>
              <p v-html="frmPreview" v-else></p>
            </el-tab-pane>
          </template>
        </el-tabs>
      </div>
      <!--流程设计-->
      <div class="editor-container" v-show="active==2">
        <flow-editor ref="flowEditor" :form-template="currentForm" :scheme-content="postObj.schemeContent"></flow-editor>
      </div>

    </el-form>
    <div class="edit-btns text-center">
      <el-button size="small" v-if="active>0" style="margin-left: 10px;" type="primary" @click="pre">上一步</el-button>
      <el-button size="small" v-if="active<2" style="margin-left: 10px;" type="primary" @click="next">下一步</el-button>
      <el-button size="small" v-loading="loading" style="margin-left: 10px;" type="success" @click="submitForm">保存
      </el-button>
    </div>
  </div>
</template>

<script>
  import MDinput from '@/components/MDinput'
  import FlowEditor from '@/components/FlowEditor' // 流程设计器
  import Sticky from '@/components/Sticky' // 粘性header组件
  import * as flowschemes from '@/api/flowschemes'
  import * as forms from '@/api/forms'

  const defaultScheme = {
    id: undefined,
    schemeCode: new Date().getTime(),
    frmId: '',
    frmType: 0,
    description: '',
    schemeName: '',
    delete: 0, // 删除标记
    enabled: 1,
    schemeContent: '' // 表单中的控件属性描述
  }

  export default {
    name: 'flow-scheme-dtl',
    components: {
      MDinput,
      Sticky,
      FlowEditor
    },
    props: {
      isEdit: {
        type: Boolean,
        default: false
      }
    },
    data() {
      const validateRequire = (rule, value, callback) => {
        if (value === '') {
          this.$message({
            message: rule.field + '为必传项',
            type: 'error'
          })
          callback(null)
        } else {
          callback()
        }
      }
      return {
        postObj: Object.assign({}, defaultScheme),
        loading: false,
        forms: [],
        currentForm: null, // 当前选中的form表单字段信息
        frmPreview: '',

        active: 0,
        rules: {
          schemeNameRule: [{
            validator: validateRequire
          }],
          frmRule: [{
            validator: validateRequire
          }]
        }
      }
    },
    computed: {
      contentShortLength() {
        return this.postObj.description ? this.postObj.description.length : 0
      }
    },
    created() {
      forms.getList().then(response => {
        // 获取表单列表
        this.forms = response.data
        if (this.isEdit) {
          const id = this.$route.params && this.$route.params.id
          flowschemes.get({
            id: id
          }).then(response => {
            this.postObj = response.result
            this.onFrmChange(this.postObj.frmId)
          }).catch(err => {
            console.log(err)
          })
        } else {
          this.postObj = Object.assign({}, defaultScheme)
          this.postObj.frmId = this.forms[0].id
          this.onFrmChange(this.postObj.frmId)
        }
      })
    },
    methods: {
      next() {
        if (this.active++ > 1) this.active = 0
      },
      pre() {
        if (this.active-- < 0) this.active = 0
      },
      handleTabClick(tab, event) {
        this.onFrmChange(tab.$attrs.id)
      },
      onFrmChange(val) {
        // 预览表单
        forms
          .get({
            id: val
          })
          .then(response => {
            this.postObj.frmType = response.result.frmType
            if (response.result.frmType === 1) return
            if (response.result.frmType === 2) {
              response.result.html = response.result.content
              this.frmPreview = response.result.content
              return
            }
            this.frmPreview = response.result.html
            this.currentForm = JSON.parse(response.result.contentData)
          })
      },
      submitForm() {
        this.$refs.postObj.validate(valid => {
          if (valid) {
            this.loading = true
            this.postObj.schemeContent = this.$refs.flowEditor.getSchemeContent()
            if (this.postObj.schemeContent === '-1') {
              this.$message({
                message: '请调整流程设计',
                type: 'error'
              })
              this.loading = false
              return
            }

            if (this.isEdit) {
              flowschemes.update(this.postObj).then(() => {
                this.loading = false
                this.$notify({
                  title: '成功',
                  message: '修改成功',
                  type: 'success',
                  duration: 2000
                })
              })
            } else {
              flowschemes.add(this.postObj).then(() => {
                this.loading = false
                this.$notify({
                  title: '成功',
                  message: '创建成功',
                  type: 'success',
                  duration: 2000
                })
              })
            }
  
            this.loading = false
          } else {
            console.log('error submit!!')
            return false
          }
        })
      }
    }
  }

</script>

<style rel="stylesheet/scss" lang="scss">
  @import 'src/styles/mixin.scss';

  .createPost-container {
    margin: 10px;
    padding: 10px;
    background-color: white;
    min-height: 100%;

    .createPost-main-container {
      max-width: 800px;
      margin: 0 auto;
      margin-top: 40px;
    }
  }

  .steps {
    max-width: 1000px;
    margin: 0 auto;

    .el-step__main {
      margin-left: -21px;
    }
  }

  .edit-btns {
    padding: 20px;
  }

  .el-tabs--border-card {
    background: #fff;
    border: 1px solid #dcdfe6;
    -webkit-box-shadow: 0 0px 0px 0 rgba(0, 0, 0, .12), 0 0 6px 0 rgba(0, 0, 0, .04);
    box-shadow: 0 0px 0px 0 rgba(0, 0, 0, .12), 0 0 6px 0 rgba(0, 0, 0, .04);
  }

  .el-dialog__wrapper {
     z-index: 20000 !important;
  }

</style>
