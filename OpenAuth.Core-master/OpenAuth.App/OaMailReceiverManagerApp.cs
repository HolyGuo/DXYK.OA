using System;
using System.Collections.Generic;
using System.Linq;
using OpenAuth.App.Request;
using OpenAuth.App.Response;
using OpenAuth.Repository.Domain;
using OpenAuth.Repository.Interface;

namespace OpenAuth.App
{
    public class OaMailReceiverManagerApp : BaseApp<OaMailReceiver>
    {
        public OaMailReceiverManagerApp(IUnitWork unitWork, IRepository<OaMailReceiver> repository) : base(unitWork, repository)
        {
        }

        /// <summary>
        /// 添加邮件
        /// </summary>
        /// <param name="OaMailReceiver">The org.</param>
        public string Add(OaMailReceiver oaMailReceiver)
        {
            Repository.Add(oaMailReceiver);

            return oaMailReceiver.Id;
        }

        /// <summary>
        /// 根据条件查询收件总数
        /// </summary>
        public int QueryInDataRecord(MailReceiverRequest param)
        {
            var list = Repository.Find(t => t.mail_title.Contains(param.keyWords)).ToList();
            if (param.insession == "0")
            {
                list = list.Where(t => t.receiver_id == param.userid).ToList();
            }
            else
            {
                list = list.Where(t => t.sender_id == param.userid).ToList();
            }
            if (param.status == "1")
            {
                list = list.Where(t => t.read_time > DateTime.MinValue).ToList();
            }
            else
            {
                list = list.Where(t => t.read_time is null).ToList();
            }
            return list.Count;
        }

        /// <summary>
        /// 根据条件查询收件信息
        /// </summary>
        public List<OaMailReceiver> QueryInByFilter(MailReceiverRequest param)
        {
            var list = Repository.Find(t => t.mail_title.Contains(param.keyWords)).ToList();
            if (param.insession == "0")
            {
                list = list.Where(t => t.receiver_id == param.userid).ToList();
            }
            else
            {
                list = list.Where(t => t.sender_id == param.userid).ToList();
            }
            if (param.status == "1")
            {
                list = list.Where(t => t.read_time > DateTime.MinValue).ToList();
            }
            else
            {
                list = list.Where(t => t.read_time is null).ToList();
            }
            return list.Skip(param.offset).Take(param.limit).ToList();
        }

        /// <summary>
        /// 根据id查找信息
        /// </summary>
        /// <param name="id"></param>
        public List<OaMailReceiver> GetByMailId(string id)
        {
            var res = Repository.Find(u => u.mail_id == id).ToList();
            return res;
        }

    }
}
