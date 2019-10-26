﻿using System.Linq;
using System.Reflection;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using OpenAuth.App.Interface;

namespace OpenAuth.Mvc.Models
{
    public class OpenAuthFilter : IActionFilter
    {
        private readonly IAuth _authUtil;

        public OpenAuthFilter(IAuth authUtil)
        {
            _authUtil = authUtil;
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            var description =
                (Microsoft.AspNetCore.Mvc.Controllers.ControllerActionDescriptor)context.ActionDescriptor;

            //添加有允许匿名的Action，可以不用登录访问，如Login/Index
            var anonymous = description.MethodInfo.GetCustomAttribute(typeof(AllowAnonymousAttribute));
            if (anonymous != null)
            {
                return;
            }

            if (!_authUtil.CheckLogin())
            {
                context.Result = new RedirectResult("/Login/Index");
                return;
            }

            //------------------------以下内容都需要登录--------------------------------------------

            //如果是ajax请求的，跳过模块授权认证
            var headers = context.HttpContext.Request.Headers;
            var xreq = headers.ContainsKey("x-requested-with");
            if (xreq && headers["x-requested-with"] == "XMLHttpRequest")
            {
                return;
            }

            var Controllername = description.ControllerName.ToLower();
            var Actionname = description.ActionName.ToLower();
            //控制器白名单，在该名单中的控制器，需要登录，但不需要授权
            var whiteController = new[] {"usersession","home","redirects"};
            if (whiteController.Contains(Controllername))
            {
                return;
            }

            var currentModule = _authUtil.GetCurrentUser().Modules.FirstOrDefault(u => u.Url.ToLower().Contains(Controllername));
            //当前登录用户没有Action记录
            if (currentModule == null)
            {
                context.Result = new RedirectResult("/Error/Auth");
            }
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            return;
        }
    }
}
