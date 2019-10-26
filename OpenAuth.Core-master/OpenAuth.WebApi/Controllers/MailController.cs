using System;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using OpenAuth.App;
using OpenAuth.App.Request;
using OpenAuth.Repository.Domain;
using System.Linq;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.Net.Http.Headers;
using OpenAuth.App.Interface;
using System.Collections.Generic;

namespace OpenAuth.WebApi.Controllers
{
    /// <summary>
    /// 邮件操作
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MailController : Controller
    {
        private readonly OaMailManagerApp _mailapp;
        private readonly OaAttachmentManagerApp _atachmentapp;
        private readonly OaMailReceiverManagerApp _mailReceiverapp;
        private IAuth _authUtil;

        /// <summary>
        /// 邮件
        /// </summary>
        /// <param name="app"></param>
        public MailController(IAuth authUtil, OaMailManagerApp Mailapp, OaAttachmentManagerApp Attachmentapp,
            OaMailReceiverManagerApp mailReceiverapp)
        {
            _authUtil = authUtil;
            _mailapp = Mailapp;
            _atachmentapp = Attachmentapp;
            _mailReceiverapp = mailReceiverapp;
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="reqMsg"></param>
        /// <returns></returns>
        [HttpPost]
        public Response<string> SendMail([FromBody]OaMailQueryRequest reqMsg)
        {
            var result = new Response<string>();
            //获取当前用户信息
            var user = _authUtil.GetCurrentUser().User;
            try
            {
                OaMail oaMail = new OaMail();
                oaMail.title = reqMsg.title;
                oaMail.content = reqMsg.content;
                oaMail.publish_time = DateTime.Now;
                oaMail.group_id = "GXBBWGKGLJ";
                string id = _mailapp.Add(oaMail);
                result.Result = id;
                var files = reqMsg.files;
                foreach (var item in reqMsg.reciervers.Split(','))
                {
                    OaMailReceiver oaMailReceiver = new OaMailReceiver();
                    oaMailReceiver.mail_id = id;
                    oaMailReceiver.mail_title = reqMsg.title;
                    var idarr = item.Split('#');
                    oaMailReceiver.receiver_id = idarr[0];
                    oaMailReceiver.receiver_name = idarr[1];
                    oaMailReceiver.sender_id = user.Id;
                    oaMailReceiver.sender_name = user.Name;
                    oaMailReceiver.attachment_ids = reqMsg.files;
                    oaMailReceiver.send_time = DateTime.Now;
                    _mailReceiverapp.Add(oaMailReceiver);
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult UploadFile(IFormFile file)
        {
            string id = "";
            if (file != null)
            {
                var fileDir = "D:\\wopi\\files";
                if (!Directory.Exists(fileDir))
                {
                    Directory.CreateDirectory(fileDir);
                }
                //文件名称
                string projectFileName = file.FileName;

                //上传的文件的路径
                string filePath = fileDir + $@"\{projectFileName}";
                if (!System.IO.File.Exists(filePath))
                {
                    using (FileStream fs = System.IO.File.Create(filePath))
                    {
                        file.CopyTo(fs);
                        fs.Flush();
                    }
                    OaAttachment oaAttachment = new OaAttachment();
                    oaAttachment.file_name = file.FileName;
                    var namearr = file.FileName.Split('.');
                    oaAttachment.file_ext = namearr[namearr.Length - 1];
                    oaAttachment.file_size = file.Length.ToString();
                    oaAttachment.publish_path = string.Format("D:\\wopi\\files\\{0}", file.FileName);
                    oaAttachment.group_id = "GXBBWGKGLJ";
                    id = _atachmentapp.Add(oaAttachment);
                }
                else
                {
                    id = _atachmentapp.QueryIdByPath(filePath);
                }
            }
            else
            {
                return Json("no");
            }
            return Json(id);
        }

        ///<summary>
        /// 根据条件查询收发件信息
        ///</summary>
        [HttpPost]
        public Response<object> QueryInByFilter([FromBody]MailReceiverRequest reqMsg)
        {
            var result = new Response<object>();
            //获取当前用户信息
            var user = _authUtil.GetCurrentUser().User;
            reqMsg.userid = user.Id;
            var total = _mailReceiverapp.QueryInDataRecord(reqMsg);
            var list = _mailReceiverapp.QueryInByFilter(reqMsg);
            result.Result = new { count = total, data = list };
            return result;
        }

        ///<summary>
        /// 根据Id查询邮件信息表(oa_mail)
        ///</summary>
        [HttpGet]
        public Response<OaMail> GetMailDetailById(string id)
        {
            var result = new Response<OaMail>();
            result.Result = _mailapp.GetById(id);
            return result;
        }

        ///<summary>
        /// 根据邮件Id查询收件人信息
        ///</summary>
        [HttpGet]
        public Response<List<OaMailReceiver>> GetReceiverById(string id)
        {
            var result = new Response<List<OaMailReceiver>>();
            result.Result = _mailReceiverapp.GetByMailId(id);
            return result;
        }

        ///<summary>
        /// 根据Ids查询附件信息
        ///</summary>
        [HttpGet]
        public Response<List<OaAttachment>> GetAttachById(string id)
        {
            var result = new Response<List<OaAttachment>>();
            List<OaAttachment> reslst = new List<OaAttachment>();
            if (!string.IsNullOrEmpty(id))
            {
                var idarr = id.Split(',');
                foreach (var item in idarr)
                {
                    OaAttachment attach = _atachmentapp.GetById(item);
                    reslst.Add(attach);
                }
            }
            result.Result = reslst;
            return result;
        }


    }
}