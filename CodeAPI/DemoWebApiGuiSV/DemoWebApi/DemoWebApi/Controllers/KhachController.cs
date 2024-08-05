using DemoWebApi.DataType;
using DemoWebApi.Models;
using DemoWebApi.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace DemoWebApi.Controllers
{
    public class KhachController : ApiController
    {
        private KhachService khachService = new KhachService();

        // GET: Khach
        [HttpGet]
        public async Task<IHttpActionResult> GetById(string id)
        {
            var res = await khachService.KhachGetById(id);
            return Json(res);
        }
        [HttpPost]
        public async Task<IHttpActionResult> Save(KhachDataType khachDataType)
        {
            var res = await khachService.Save(khachDataType);
            return Json(res);
        }
    }
}