import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/users/load',
    method: 'get',
    params
  })
}

export function get(params) {
  return request({
    url: '/users/get',
    method: 'get',
    params
  })
}

export function add(data) {
  return request({
    url: '/users/addorupdate',
    method: 'post',
    data
  })
}

export function update(data) {
  return request({
    url: '/users/addorupdate',
    method: 'post',
    data
  })
}

export function del(data) {
  return request({
    url: '/users/delete',
    method: 'post',
    data
  })
}

export function loadByRole(params) {
  return request({
    url: '/users/loadByRole',
    method: 'get',
    params
  })
}

