<template>
  <div>
    <treeselect :default-expand-level="3" :options="orgs" :multiple="false" :show-count="true" @select="onSelect" @input="input"></treeselect>
    <el-transfer v-model="selectUsers" :data="orgUsers" @change="handleChange" :titles="['系统用户', '已选用户']"></el-transfer>
  </div>
</template>

<script>
  import {
    listToTreeSelect
  } from '@/utils'
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  import * as login from '@/api/login'
  import * as apiUsers from '@/api/users'

  export default {
    name: 'select-users',
    components: {
      Treeselect
    },
    props: ['users'],
    data() { // todo:兼容layui的样式、图标
      return {
        selectUsers: this.users,
        orgUsers: [],
        orgs: []
      }
    },
    watch: {
      users(val) { // 因为组件只挂载一次，后期只能通过watch来改变selectusers的值
        this.selectUsers = val
      }
    },
    mounted() {
      var _this = this
      login.getOrgs().then(response => {
        var orgs = response.result.map(function(item, index, input) {
          return {
            id: item.id,
            label: item.name,
            parentId: item.parentId
          }
        })
        var tree = listToTreeSelect(orgs)

        _this.orgs = tree
        _this.getOrgUsers('')

        console.log(_this.selectUsers)
      })
    },
    methods: {
      getOrgUsers(orgId) {
        var _this = this
        apiUsers.getList({ orgId: orgId }).then(response => {
          _this.orgUsers = response.data.map(function(item, index, input) {
            return { key: item.id, label: item.name }
          })
        })
      },
      onSelect: function(node, instanceId) {
        this.getOrgUsers(node.id)
      },
      input: function(node, instanceId) {
        if (node === undefined) { // 清空选择
          this.getOrgUsers('')
        }
      },
      handleChange(value, direction, movedKeys) {
        console.log(JSON.stringify(this.selectUsers))
        this.$emit('users-change', this.selectUsers)
      }
    }
  }

</script>

<style scoped>
 .el-transfer{
   margin-top:10px;
 }
</style>
