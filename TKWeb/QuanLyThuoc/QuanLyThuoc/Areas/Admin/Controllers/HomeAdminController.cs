using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuanLyThuoc.Controllers;
using QuanLyThuoc.Models;


namespace QuanLyThuoc.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]

    public class HomeAdminController : Controller
    {
        QuanLyThuocContext db = new QuanLyThuocContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("danhmucthuoc")]

        public IActionResult DanhMucThuoc(int? page)

        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.TDanhMucThuocs.AsNoTracking().OrderBy(x => x.TenThuoc).ToList();
            PageList<TDanhMucThuoc> lst = new PageList<TDanhMucThuoc>(lstsanpham, pageNumber, pageSize);
            return View(lst);
        }
    }
}
