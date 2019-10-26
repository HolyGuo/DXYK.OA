<template>
  <div>
    <sticky :className="'sub-navbar'">
      <div class="filter-container">
        {{postObj.customName}}
        <el-tag size="mini" style="margin-left: 10px;">{{postObj.createDate}}</el-tag>
        <el-tag size="mini">{{postObj.activityName}}</el-tag>
      </div>
    </sticky>
    <div class="createPost-container">

      <el-collapse v-model="activeNames">
        <el-collapse-item name="1">
          <el-card class="box-card" v-if="postObj.frmType ==1">
            <component v-bind:is="postObj.dbName != '' && postObj.dbName +'Detail'" :frmData="postObj.frmData">
            </component>
          </el-card>
          <el-card class="box-card" v-else>
            <p v-html="postObj.frmPreviewHtml"></p>
          </el-card>
        </el-collapse-item>
        <el-collapse-item title="流转记录" name="2">
          <el-timeline>
            <el-timeline-item v-for="(history, index) in histories" :key="index" :timestamp="history.createDate">
              {{history.content}}
            </el-timeline-item>
          </el-timeline>
        </el-collapse-item>
        <el-collapse-item title="流程图" name="3">
          <flow-detail ref="flowEditor" :instance="postObj"></flow-detail>
        </el-collapse-item>
      </el-collapse>

    </div>
  </div>
</template>

<script>
  import FlowDetail from '@/components/FlowEditor/detail' // 流程设计器
  import Sticky from '@/components/Sticky' // 粘性header组件
  import * as apiFlowinstances from '@/api/flowinstances'

  export default {
    name: 'flowinstance-detail',
    components: {
      Sticky,
      FlowDetail
    },
    data() {
      return {
        postObj: {
          customName: '',
          schemeContent: '',
          createDate: '',
          activityName: '',
          code: '',
          dbName: '',
          frmType: 0,
          frmData: '',
          activityId: ''
        },
        activeNames: ['1', '2', '3'], // 展开的信息
        loading: false,
        histories: [],
        activities: [{
          content: '支持使用图标',
          timestamp: '2018-04-12 20:46',
          size: 'large',
          type: 'primary',
          icon: 'el-icon-more'
        }, {
          content: '支持自定义颜色',
          timestamp: '2018-04-03 20:46',
          color: '#0bbd87'
        }, {
          content: '支持自定义尺寸',
          timestamp: '2018-04-03 20:46',
          size: 'large'
        }, {
          content: '默认样式的节点',
          timestamp: '2018-04-03 20:46'
        }]
      }
    },
    created() {
      const id = this.$route.params && this.$route.params.id
      apiFlowinstances.get({
        id: id
      }).then(response => {
        this.postObj = response.result
      }).catch(err => {
        console.log(err)
      })

      apiFlowinstances.queryHistories({
        flowInstanceId: id
      }).then(response => {
        this.histories = response.result
      }).catch(err => {
        console.log(err)
      })
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
