using System;
using System.Collections.Generic;
using System.Text;

namespace OpenAuth.App.Request
{
    public class OaMailQueryRequest
    {
        public string title { get; set; }
        public string content { get; set; }
        public string reciervers { get; set; }
        public string files { get; set; }
    }
}
