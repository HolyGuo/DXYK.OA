const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  name: state => state.user.name,
  isIdentityAuth: state => state.serverConf.isIdentityAuth,
  modules: state => state.user.modules,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,
  addRouters: state => state.permission.addRouters,
  permission_routers: state => state.permission.routers,
  // mail
  mailId: state => state.mail.mailId,
  draftId: state => state.mail.draftId,
  pageType: state => state.mail.pageType,
  mailType: state => state.mail.mailType,
  target: state => state.mail.target,
  senderName: state => state.mail.senderName,
  sendTime: state => state.mail.sendTime,
  attachs: state => state.mail.attachs
}
export default getters
