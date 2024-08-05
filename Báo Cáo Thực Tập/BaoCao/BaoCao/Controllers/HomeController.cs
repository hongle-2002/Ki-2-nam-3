using BaoCao.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuanLySach.Models;
using QuanLySach.Models.Authentication;
using System.Diagnostics;
using X.PagedList;

namespace QuanLySach.Controllers
{
    public class HomeController : Controller
    {
        QlsachContext db = new QlsachContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        [Authentication]
        public IActionResult Index(int? page)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.Saches.AsNoTracking().OrderBy(x => x.TenSach);
            PagedList<Sach> list = new PagedList<Sach>(lstsanpham, pageNumber, pageSize);
            return View(list);
        }
        public IActionResult TimKiemSanPham(String tenSanPham)
        {
            List<Sach> lstsanpham = db.Saches.AsNoTracking().Where(x => x.TenSach.Contains(tenSanPham)).ToList();
            ViewBag.tenSanPham = tenSanPham;
            return View(lstsanpham);
        }
        public IActionResult SanPhamTheoLoai(String matheloai)
        {
            List<Sach> lstsanpham = db.Saches.Where(x=>x.MaTheLoai == matheloai).OrderBy(x=>x.TenSach).ToList();
            return View(lstsanpham);
        }
        public IActionResult ChiTietSanPham(string masach)
        {
            var sach = db.Saches.SingleOrDefault(x => x.MaSach == masach);
            var anhSach = db.AnhSaches.Where(x=>x.MaSach==masach).ToList();
            ViewBag.anhSach = anhSach;
            return View(sach);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}