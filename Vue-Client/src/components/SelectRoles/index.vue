<template>
  <div>
    <el-transfer v-model="selectRoles" :data="orgRoles" @change="handleChange" :titles="['系统角色', '已选角色']"></el-transfer>
  </div>
</template>

<script>
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  import * as apiRoles from '@/api/roles'

  export default {
    name: 'select-roles',
    components: {
      Treeselect
    },
    props: ['roles'],
    data() { // todo:兼容layui的样式、图标
      return {
        selectRoles: this.roles,
        orgRoles: [] // 该组织的全部角色
      }
    },
    watch: {
      roles(val) { // 因为组件只挂载一次，后期只能通过watch来改变selectusers的值
        this.selectRoles = val
      }
    },
    mounted() {
      console.log('mounted')
      var _this = this
      _this.getRoles()
    },
    methods: {
      getRoles() {
        var _this = this
        apiRoles.getList({ }).then(response => {
          _this.orgRoles = response.result.map(function(item, index, input) {
            return { key: item.id, label: item.name }
          })
        })
      },
      input: function(node, instanceId) {
        this.getRoles('')
      },
      handleChange(value, direction, movedKeys) {
        console.log(JSON.stringify(this.selectRoles))
        this.$emit('roles-change', this.selectRoles)
      }
    }
  }

</script>

<style scoped>
 .el-transfer{
   margin-top:10px;
 }
</style>
