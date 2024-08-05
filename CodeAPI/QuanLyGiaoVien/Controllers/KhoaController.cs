using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QuanLyGiaoVien.Controllers
{
    public class KhoaController : ApiController
    {
        [HttpGet]
        public List<tTheLoai> getAll()
        {
            DataClasses1DataContext GiaoVienConnection = new DataClasses1DataContext();
            return GiaoVienConnection.tTheLoais.ToList();
        }
    }
}
