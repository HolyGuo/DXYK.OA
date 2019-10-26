import request from '@/utils/request'
import { getToken } from '@/utils/auth' // 验权

export function login(username, password) {
  return request({
    url: '/check/login',
    method: 'post',
    data: {
      Account: username,
      Password: password,
      AppKey: 'openauth'
    }
  })
}

export function getInfo(token) {
  return request({
    url: '/check/getusername',
    method: 'get',
    params: { token }
  })
}

export function getModules(token) {
  return request({
    url: '/check/getmodules',
    method: 'get',
    params: { token: getToken() }
  })
}

export function getModulesTree(token) {
  return request({
    url: '/Check/GetModulesTree',
    method: 'get',
    params: { token: getToken() }
  })
}

export function getOrgs(token) {
  return request({
    url: '/check/getorgs',
    method: 'get',
    params: { token: getToken() }
  })
}

export function getSubOrgs(orgId) {
  return request({
    url: '/check/getSubOrgs',
    method: 'get',
    params: { orgId: orgId }
  })
}

export function logout() {
  return request({
    url: '/check/logout',
    method: 'post'
  })
}
