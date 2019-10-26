<!--流程详情界面-->
<template>
  <div>
     <div id="flowPanel"></div>
  </div>
</template>
<script>
  import 'jquery'
  import './flowlayout'
  import '@/assets/flow/GooFlow.css'
  export default {
    name: 'flow-detail',
    props: {
      instance: Object
    },
    data() {
      return {
        flowDesignPanel: null
      }
    },
  
    watch: {
      instance(val) {
        if (val !== undefined && val !== null) {
          var schemeContent = JSON.parse(val.schemeContent)
          this.flowDesignPanel = $('#flowPanel').flowdesign({
            height: '600',
            haveTool: false,
            isprocessing: true,
            activityId: val.activityId,
            nodeData: schemeContent.nodes,
            flowcontent: schemeContent
          })
        }
      }
    }
  }
</script>

<style>
#draw_flowPanel{
  width: 100vW  
}
</style>
