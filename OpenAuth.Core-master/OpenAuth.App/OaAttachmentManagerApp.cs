using System;
using System.Collections.Generic;
using System.Linq;
using OpenAuth.App.Response;
using OpenAuth.Repository.Domain;
using OpenAuth.Repository.Interface;

namespace OpenAuth.App
{
    public class OaAttachmentManagerApp : BaseApp<OaAttachment>
    {
        public OaAttachmentManagerApp(IUnitWork unitWork, IRepository<OaAttachment> repository) : base(unitWork, repository)
        {
        }

        /// <summary>
        /// 添加附件
        /// </summary>
        /// <param name="OaAttachment">The org.</param>
        public string Add(OaAttachment oaAttachment)
        {
            Repository.Add(oaAttachment);

            return oaAttachment.Id;
        }

        /// <summary>
        /// 根据存储路径查找附件
        /// </summary>
        /// <param name="OaAttachment">The org.</param>
        public string QueryIdByPath(string path)
        {
            var list = Repository.Find(t=>t.publish_path == path).ToList();
            return list[0].Id;
        }

        /// <summary>
        /// 根据id查找信息
        /// </summary>
        /// <param name="id"></param>
        public OaAttachment GetById(string id)
        {
            var res = Repository.Find(u => u.Id == id).ToList();
            return res[0];
        }


    }
}
