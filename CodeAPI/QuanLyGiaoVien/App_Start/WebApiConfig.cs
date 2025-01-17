﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace QuanLyGiaoVien
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            config.MapHttpAttributeRoutes();
			var json = config.Formatters.JsonFormatter; json.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.Objects; config.Formatters.Remove(config.Formatters.XmlFormatter);
			config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
