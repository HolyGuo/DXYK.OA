<template>

  <div class="compent-dialog-body">
	<div class="p-m">
        <el-form ref="form" label-position="left" :class="step=='1'?'':'hide'">
            <el-form-item size="small">
                <div class="block">
                    <el-tree ref="tree" :data="modules" :check-strictly="true"  show-checkbox node-key="id" default-expand-all :expand-on-click-node="false">
                        <span class="custom-tree-node" slot-scope="{ node, data }">
                            <span>{{ node.label }}</span>
                        </span>
                    </el-tree>
                </div>
            </el-form-item>
        </el-form>

        <div :class="step=='2'?'':'hide'">
            <div class="block">
                <template v-for="item in checkModules">
                    <div :key="item.id">
                        <h4 class="title">
                            {{item.parentName}} > {{item.label}}
                        </h4>
                        <div class="p-l-m">
                            <el-checkbox-group v-model="roleMenuIds">
                                <el-checkbox @change="onChange" v-for="menu in filterMenus(item.id)" :label="menu.id" :key="menu.Id"
                                    size="small">{{menu.name}}</el-checkbox>
                            </el-checkbox-group>
                        </div>
                    </div>
                </template>
            </div>
        </div>
        <div :class="step=='3'?'':'hide'">
            <div class="block">
                <template v-for="node in noSystemNodes">
                    <div :key="node.id">
                        <h4 class="title">
                            {{node.parentName}} > {{node.label}}
                        </h4>
                        <div class="p-l-m">
                            <template v-for="propy in node.properties">
                                <el-checkbox :key="propy.key"  :checked="propy.checked" :name="node.code" :label="propy.key">{{propy.description}}</el-checkbox>
                            </template>
                        </div>
                    </div>
                </template>
            </div>
        </div>
    </div>
    <div slot="footer" class="el-dialog__footer">
        <el-button size="small" @click="close">取消</el-button>
        <el-button size="small" type="primary" v-show="step > 1" @click="up">上一步</el-button>
        <el-button size="small" type="success" @click="acceRole">下一步</el-button>
    </div>
</div>

</template>

<script>
    import {
      listToTreeSelect
    } from '@/utils'
    import Treeselect from '@riophae/vue-treeselect'
    import '@riophae/vue-treeselect/dist/vue-treeselect.css'
    import * as login from '@/api/login'
    import * as apiModules from '@/api/modules'
    import * as accessObjs from '@/api/accessObjs'

    export default {
      name: 'access-modules',
      components: {
        Treeselect
      },
      props: ['roleId'],
      data() {
        return {
          currentRoleId: this.roleId,
          modules: [], // 登录用户可以访问到的所有模块
          menus: [], // 登录用户可以访问到的所有菜单
          roleMenuIds: [], // 角色分配到的菜单,只存ID
          checkModules: [], // 第一步选择的nodes
          noSystemNodes: [],
          step: 1 // 步骤
        }
      },
      watch: {
        roleId(val) { // 因为组件只挂载一次，后期只能通过watch来改变selectusers的值
          this.currentRoleId = val
          this.init()
        },
        step(val) {
          if (val === 1) {
            this.$emit('change-title', '为角色分配【可见模块】')
          } else if (val === 2) {
            this.$emit('change-title', '为角色分配【可见菜单】')
          } else {
            this.$emit('change-title', '为角色分配【可见字段】')
          }
        }
      },
      mounted() {
        var _this = this
        login.getModules().then(response => {
          var modules = response.result.map(function(item, index, input) {
            let lable = item.name
            if (!item.isSys) {
              lable += '(非系统模块，可分配字段)'
            }
            return {
              id: item.id,
              label: lable,
              parentId: item.parentId,
              parentName: item.parentName,
              isSys: item.isSys,
              code: item.code
            }
          })
          var tree = listToTreeSelect(modules)
          _this.modules = tree
        })
        // 获取用户可访问的全部的菜单
        apiModules.loadMenus('').then(response => {
          _this.menus = response.result
          _this.init()
        })
      },
      methods: {
        init() {
          this.getRoleModuleIds()
          this.getRoleMenuIds()
        },
        filterMenus(moduleId) { // 按模块过滤菜单
          return this.menus.filter(function(menu) {
            return menu.moduleId === moduleId
          })
        },
        getRoleModuleIds() { // 获取角色已分配的模块
          var _this = this
          apiModules.loadForRole(_this.roleId).then(response => {
            //  _this.roleModuleIds = response.result.map(item => item.id)
            _this.$refs.tree.setCheckedKeys(response.result.map(item => item.id))
          })
        },
        getRoleMenuIds() { // 获取角色已分配的菜单
          var _this = this
          apiModules.loadMenusForRole(_this.roleId).then(response => {
            _this.roleMenuIds = response.result.map(item => item.id)
          })
        },
        onChange(val) {
          console.log(this.roleMenuIds)
        },
        close() {
          this.$emit('close')
        },
        up() {
          this.step = this.step * 1.0 - 1
          return
        },
        acceRole() {
          // this.step = this.step*1.0 + 1
          var step = this.step * 1.0
          switch (step) {
            case 1:
              var checkNodes = this.$refs.tree.getCheckedNodes(true, false)
              if (checkNodes.length < 1) {
                this.$notify({
                  title: '提示',
                  message: '请先选择模块',
                  type: 'warning',
                  duration: 2000
                })
                return
              }
              this.checkModules = checkNodes
              this.step = 2
              break
            case 2:
              var noSystem = false
              this.noSystemNodes = []
              this.checkModules.forEach((item, index) => {
                if (!item.isSys) {
                  noSystem = true
                  apiModules.getProperties(item.code).then((res) => {
                    item.properties = res.result
                    apiModules.loadPropertiesForRole(item.code, this.roleId).then((res) => {
                      item.loadPropertiesForRole = res.result
                      item.checks = []
                      item.properties.forEach((prop) => {
                        prop.checked = false
                        item.loadPropertiesForRole.forEach((loadProp) => {
                          if (loadProp === prop.key) {
                            prop.checked = true
                          }
                        })
                      })
                      this.noSystemNodes.push(item)
                      this.step = 3
                    })
                  })
                }
              })
              if (noSystem) {
                this.saveAssign()
                // 有部分不是系统模块,需要分配字段
              } else {
                // 全是系统模块
                this.saveAssign()
                this.close()
              }
              break
            case 3:
              this.noSystemNodes.forEach((item, index) => {
                var obj = document.getElementsByName(item.code)
                var checks = []
                obj.forEach((one) => {
                  if (one.checked) {
                    checks.push(one.value)
                  }
                })
                apiModules.unAssignDataProperty(item.code, this.roleId).then(() => {
                  apiModules.assignDataProperty(item.code, this.roleId, checks).then((res) => {
                    if ((index + 1) === this.noSystemNodes.length) {
                      this.$notify({
                        title: '成功',
                        message: '分配成功',
                        type: 'success',
                        duration: 2000
                      })
                      this.close()
                    }
                  })
                })
              })
          }
          return
        },
        saveAssign() {
          accessObjs.assign({
            type: 'RoleModule',
            firstId: this.roleId,
            secIds: this.$refs.tree.getCheckedKeys()
          }).then(resp => {
            accessObjs.assign({
              type: 'RoleElement',
              firstId: this.roleId,
              secIds: this.roleMenuIds
            }).then(response => {
              this.$notify({
                title: '成功',
                message: '分配成功',
                type: 'success',
                duration: 2000
              })
            })
          })
        }

      }
    }
</script>

<style scoped>
    .custom-tree-node {
        flex: 1;
        display: flex;
        align-items: left;
        justify-content: space-between;
        font-size: 14px;
        padding-right: 8px;
    }

    .p-m {
        padding: 10px;
    }
    .p-l-m{
        padding-left: 10px;
    }

    .hide {
        display: none
    }
</style>