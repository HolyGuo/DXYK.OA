'use strict'
module.exports = {
  OIDC: {  //使用identityserver配置
    authority: '"http://demo.openauth.me:12796"',
    clientId: '"OpenAuth.Pro"',
    redirectUri: '"http://demo.openauth.me:1803/#/oidc-callback"',
    postLogoutRedirectUri:'"http://demo.openauth.me:1803"',
    responseType: '"code"',
    scope: '"openid profile openauthapi"',
    automaticSilentRenew: true,
    silentRedirectUri: '"http://demo.openauth.me:1803/silent-renew-oidc.html"'
  },
  NODE_ENV: '"production"',
  BASE_API:'"http://119.84.146.233:52789/api"',
  BASE_IMG_URL:'"http://119.84.146.233:52789"'  //附件的根目录
}
