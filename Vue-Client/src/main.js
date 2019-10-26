import Vue from 'vue'
import layer from 'vue-layer'

import 'normalize.css/normalize.css'// A modern alternative to CSS resets

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN' // lang i18n

import '@/styles/index.scss' // global css

import App from './App'
import router from './router'
import store from './store'

import '@/icons' // icon
import '@/permission' // permission control

// 请假条表单和详情
import FrmLeaveReqAdd from '@/views/forms/userDefine/frmLeaveReq/add'
import FrmLeaveReqDetail from '@/views/forms/userDefine/frmLeaveReq/detail'

import '../static/ueditor/ueditor.config.js'
import '../static/ueditor/ueditor.all.min.js'
import '../static/ueditor/lang/zh-cn/zh-cn.js'
import '../static/ueditor/ueditor.parse.min.js'
import '../static/ueditor/formdesign/leipi.formdesign.v4.js'
import '../static/flow/GooFlow.js'
import '../static/flow/GooFunc.js'
import Multiselect from 'vue-multiselect';// 使用的一个多选框组件，element-ui的select不能满足所有需求
import 'vue-multiselect/dist/vue-multiselect.min.css';// 多选框组件css
import '@/components/Icon-svg/index'; // 封装的svg组件
import '@/assets/iconfont/iconfont'; // iconfont 具体图标见https://github.com/PanJiaChen/vue-element-admin/wiki
import iconsvg from '@/components/Icon-svg/icon-svg.vue'; // 封装的svg组件
import { parseTime } from '@/utils';

Vue.use(ElementUI, { locale })

Vue.config.productionTip = false
Vue.prototype.$layer = layer(Vue, {
  msgtime: 3
})
Vue.component('FrmLeaveReqAdd', FrmLeaveReqAdd)
Vue.component('FrmLeaveReqDetail', FrmLeaveReqDetail)
Vue.component('multiselect', Multiselect);
Vue.component('icon-svg', iconsvg);

Vue.filter('parseTime', parseTime)

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
