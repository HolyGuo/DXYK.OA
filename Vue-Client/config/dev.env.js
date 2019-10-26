'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  OIDC: {  //使用identityserver配置
    authority: '"http://localhost:12796"',
    clientId: '"OpenAuth.Pro"',
    redirectUri: '"http://localhost:1803/#/oidc-callback"',
    postLogoutRedirectUri:'"http://localhost:1803"',
    responseType: '"code"',
    scope: '"openid profile openauthapi"',
    automaticSilentRenew: true,
    silentRedirectUri: '"http://localhost:1803/silent-renew-oidc.html"'
  },
  NODE_ENV: '"development"',
  BASE_API: '"http://localhost:52789/api"',
  BASE_IMG_URL: '"http://localhost:52789"' //附件的根目录
})
