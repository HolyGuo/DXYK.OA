using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OpenAuth.App.Request
{
    public class MailReceiverRequest
    {
        /// <summary>
        /// 单页行数
        /// </summary>
        [Range(1, 100)]
        public int limit { get; set; }
        
        /// <summary>
        /// 查询关键字
        /// </summary>
        public string keyWords { get; set; }

        /// <summary>
        /// 页码
        /// </summary>
        [Range(1, int.MaxValue)]
        public int page { get; set; } = 1;

        /// <summary>
        /// 状态
        /// </summary>
        public string status { get; set; }

        /// <summary>
        /// 忽略
        /// </summary>
        public int offset { get { return (page - 1) * limit; } }

        /// <summary>
        /// 排序字段
        /// </summary>
        public string field { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        public string order { get; set; }

        /// <summary>
        /// 拼接排序sortField + order (如： id Asc)
        /// </summary>
        public string OrderBy
        {
            get
            {
                if (!string.IsNullOrEmpty(field) && !string.IsNullOrEmpty(order))
                {
                    return field + " " + order;
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// 登录用户ID
        /// </summary>
        public string userid { get; set; }

        /// <summary>
        /// 收件或发件
        /// </summary>
        public string insession { get; set; }
        
    }
}
