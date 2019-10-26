//*******************************
// Create By Holy Guo
// Date 2019-10-20 15:28
//*******************************

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using OpenAuth.Repository.Core;
namespace OpenAuth.Repository.Domain
{
    /// <summary>
    /// 收件人信息表
    /// </summary>
    [Table("oa_mail_receiver")]
    public partial class OaMailReceiver : Entity
    {
        ///<summary>
        /// 邮件id
        ///</summary>
        public virtual string mail_id { get; set; }
        ///<summary>
        /// 邮件标题
        ///</summary>
        public virtual string mail_title { get; set; }
        ///<summary>
        /// 收件人id
        ///</summary>
        public virtual string receiver_id { get; set; }
        ///<summary>
        /// 收件人名称
        ///</summary>
        public virtual string receiver_name { get; set; }
        ///<summary>
        /// 发件人id
        ///</summary>
        public virtual string sender_id { get; set; }
        ///<summary>
        /// 发件人名称
        ///</summary>
        public virtual string sender_name { get; set; }
        ///<summary>
        /// 附件ids
        ///</summary>
        public virtual string attachment_ids { get; set; }
        ///<summary>
        /// 发件时间
        ///</summary>
        public virtual DateTime? send_time { get; set; }
        ///<summary>
        /// 阅读时间
        ///</summary>
        public virtual DateTime? read_time { get; set; }
    }
}

