<template>
  <div class="createPost-container">
    <sticky :className="'sub-navbar '">
      <el-row>
        <el-col :span="8"> {{flowObj.customName}}</el-col>
        <el-col :span="16">
          <el-input style="width:200px" v-model="postObj.verificationOpinion" placeholder="请输入审核意见"></el-input>
      <verify-status v-model="postObj.verificationFinally" />
        <el-button v-loading="loading" style="margin-left: 10px;" type="success" @click="ReWriteForm">修订表单
        </el-button>
        <el-button v-loading="loading" style="margin-left: 10px;" type="success" @click="submitForm">提交
        </el-button>
        </el-col>
      </el-row>
    </sticky>

    <el-card class="box-card" v-if="flowObj.frmType ==1">
      <component v-bind:is="flowObj.dbName != '' && flowObj.dbName +'Detail'" :frmData="flowObj.frmData"></component>
    </el-card>
    <el-card class="box-card" v-else>
      <p v-html="flowObj.frmPreviewHtml"></p>
    </el-card>
    <flow-detail ref="flowEditor" :instance="flowObj"></flow-detail>
  </div>

</template>

<script>
  import FlowDetail from '@/components/FlowEditor/detail' // 流程设计器
  import Sticky from '@/components/Sticky' // 粘性header组件
  import VerifyStatus from './Dropdown/VerifyStatus'
  import * as apiFlowinstances from '@/api/flowinstances'

  export default {
    name: 'verify-flowinstance',
    components: {
      Sticky,
      FlowDetail,
      VerifyStatus
    },
    data() {
      return {
        loading: false, // 按钮加载loading
        postObj: {
          flowInstanceId: '',
          verificationOpinion: '',
          verificationFinally: 1
        },
        flowObj: {
          customName: '',
          schemeContent: '',
          createDate: '',
          activityName: '',
          code: '',
          dbName: '',
          frmType: 0,
          frmData: '',
          activityId: ''
        }
      }
    },
    created() {
      const id = this.$route.params && this.$route.params.id
      this.postObj.flowInstanceId = id
      apiFlowinstances.get({
        id: id
      }).then(response => {
        this.flowObj = response.result
      }).catch(err => {
        console.log(err)
      })
    },
    methods: {
      submitForm() {
        this.loading = true
        apiFlowinstances.verify(this.postObj).then(response => {
          this.loading = false
          this.$notify({
            title: '成功',
            message: '创建成功',
            type: 'success',
            duration: 2000
          })
        })
      },
      ReWriteForm() {
        this.loading = true
        apiFlowinstances.verify(this.postObj).then(response => {
          this.loading = false
          this.$notify({
            title: '成功',
            message: '创建成功',
            type: 'success',
            duration: 2000
          })
        })
      }
    }
  }

</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "src/styles/mixin.scss";

  .createPost-container {
    position: relative;

    .createPost-main-container {
      padding: 40px 45px 20px 50px;

      .postInfo-container {
        position: relative;
        @include clearfix;
        margin-bottom: 10px;

        .postInfo-container-item {
          float: left;
        }
      }

      .editor-container {
        min-height: 500px;
        margin: 0 0 30px;

        .editor-upload-btn-container {
          text-align: right;
          margin-right: 10px;

          .editor-upload-btn {
            display: inline-block;
          }
        }
      }
    }

    .word-counter {
      width: 40px;
      position: absolute;
      right: -10px;
      top: 0px;
    }
  }

</style>
