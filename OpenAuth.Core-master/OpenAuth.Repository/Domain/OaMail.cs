//*******************************
// Create By Holy Guo
// Date 2019-10-20 01:08
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
    /// 邮件信息表
    /// </summary>
    [Table("oa_mail")]
    public partial class OaMail : Entity
    {
        public OaMail()
        {
            this.title = string.Empty;
            this.publish_time = DateTime.Now;
            this.content = string.Empty;
            this.group_id = string.Empty;
            this.re_vision = 0;
            this.created_by = 0;
            this.created_time = DateTime.Now;
            this.updated_by = 0;
            this.updated_time = DateTime.Now;
            this.deleted_by = 0;
            this.deleted_time = DateTime.Now;
        }

        ///<summary>
        /// 标题
        ///</summary>
        public virtual string title { get; set; }
        ///<summary>
        /// 发布时间
        ///</summary>
        public virtual DateTime? publish_time { get; set; }
        ///<summary>
        /// 内容
        ///</summary>
        public virtual string content { get; set; }
        ///<summary>
        /// 群组id
        ///</summary>
        public virtual string group_id { get; set; }
        ///<summary>
        /// 乐观锁
        ///</summary>
        public virtual int? re_vision { get; set; }
        ///<summary>
        /// 创建人
        ///</summary>
        public virtual long? created_by { get; set; }
        ///<summary>
        /// 创建时间
        ///</summary>
        public virtual DateTime? created_time { get; set; }
        ///<summary>
        /// 更新人
        ///</summary>
        public virtual long? updated_by { get; set; }
        ///<summary>
        /// 更新时间
        ///</summary>
        public virtual DateTime? updated_time { get; set; }
        ///<summary>
        /// 删除人
        ///</summary>
        public virtual long? deleted_by { get; set; }
        ///<summary>
        /// 删除时间
        ///</summary>
        public virtual DateTime? deleted_time { get; set; }
    }
}

