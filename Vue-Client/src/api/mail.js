import request from '@/utils/request'

export function sendMail(title, content, reciervers, files) {
    return request({
        url: '/Mail/SendMail',
        method: 'post',
        data: {
          title,
          content,
          reciervers,
          files
        }
      })
}

export function GetInboxList(data) {
  return request({
      url: '/Mail/QueryInByFilter',
      method: 'post',
      data
    })
}

export function fetchMailDetail(id) {
  return request({
    url: '/Mail/GetMailDetailById?id='+id,
    method: 'get'
  })
}

export function fetchReceiver(id) {
  return request({
      url: '/Mail/GetReceiverById?id='+id,
      method: 'get'
    })
}

export function fetchAttach(id) {
  return request({
      url: '/Mail/GetAttachById?id='+id,
      method: 'get'
    })
}
