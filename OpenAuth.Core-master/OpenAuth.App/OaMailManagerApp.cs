using System;
using System.Collections.Generic;
using System.Linq;
using OpenAuth.App.Response;
using OpenAuth.Repository.Domain;
using OpenAuth.Repository.Interface;

namespace OpenAuth.App
{
    public class OaMailManagerApp : BaseApp<OaMail>
    {
        public OaMailManagerApp(IUnitWork unitWork, IRepository<OaMail> repository) : base(unitWork, repository)
        {
        }

        /// <summary>
        /// 添加邮件
        /// </summary>
        /// <param name="OaMail">The org.</param>
        public string Add(OaMail oaMail)
        {
            Repository.Add(oaMail);

            return oaMail.Id;
        }

        /// <summary>
        /// 根据id查找信息
        /// </summary>
        /// <param name="mailid"></param>
        public OaMail GetById(string mailid)
        {
            var moduleIds = Repository.Find(u => u.Id == mailid).ToList();
            if (moduleIds.Count < 0)
            {
                return null;
            }
            return moduleIds[0];
        }

    }
}
