import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import serverConf from './modules/serverConf'
import user from './modules/user'
import tagsView from './modules/tagsView'
import permission from './modules/permission'
import mail from './modules/mail'
import getters from './getters'
import { vuexOidcCreateStoreModule } from 'vuex-oidc'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    user,
    serverConf,
    permission,
    tagsView,
    mail,
    oidcStore: vuexOidcCreateStoreModule(
      process.env.OIDC,
      // Optional OIDC store settings
      {
        namespaced: false,
        dispatchEventsOnWindow: true
      },
      // Optional OIDC event listeners
      {
        userLoaded: (user) => console.log('OIDC user is loaded:', user),
        userUnloaded: () => console.log('OIDC user is unloaded'),
        accessTokenExpiring: () => console.log('Access token will expire'),
        accessTokenExpired: () => console.log('Access token did expire'),
        silentRenewError: () => console.log('OIDC user is unloaded'),
        userSignedOut: () => console.log('OIDC user is signed out')
      }
    )
  },
  getters
})

export default store
