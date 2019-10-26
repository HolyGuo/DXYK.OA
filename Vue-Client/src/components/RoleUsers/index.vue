<template>
  <div>
    {{users}}
    <el-link :disabled="buttonVisible" @click="loadRoleUsers">{{text}}<i class="el-icon-view el-icon--right"></i> </el-link>
  </div>
</template>

<script>
  import * as apiUsers from '@/api/users'

  export default {
    name: 'role-users',
    props: ['roleId'],
    data() { // todo:兼容layui的样式、图标
      return {
        users: '',
        page: 1,
        limit: 20, // 每页条数
        text: '查看',
        buttonVisible: false
      }
    },
    mounted() {
      var _this = this
      _this.loadRoleUsers()
    },
    methods: {
      loadRoleUsers() {
        var _this = this
        apiUsers.loadByRole({ page: _this.page, limit: _this.limit, roleId: _this.roleId }).then(response => {
          if (response.data.length > 0) {
            var data = response.data.map(function(item, index, input) {
              return item.name
            })
            _this.users += '  ' + data.join(',')
            _this.page++ // 页码加
            _this.text = '>>更多'
          }
  
          if (response.data.length < _this.limit) {
            _this.users += '  没有更多用户！！'
            _this.buttonVisible = true
          }
        })
      }
    }
  }

</script>

<style scoped>
 .el-transfer{
   margin-top:10px;
 }
</style>
