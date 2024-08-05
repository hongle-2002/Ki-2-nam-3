using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using QuanAo.Models;
using System.Diagnostics;

namespace QuanAo.Controllers
{
    public class HomeController : Controller
    { 
        QlbanHangQuanAoContext db = new QlbanHangQuanAoContext();

        private readonly ILogger<HomeController> _logger;


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            var lstsanpham = db.SanPhams.ToList();
            return View(lstsanpham);
        }

        public IActionResult SanPhamTheoLoai(string maPhanloai)
        {
            var lstSanpham = db.SanPhams.Where(x => x.MaPhanLoai == maPhanloai).OrderBy(x => x.TenSanPham).ToList() ;
            return View(lstSanpham);
        }

        public IActionResult ChiTietSanPham(string maSp)
        {
            var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp);
            return View(sanPham);
        }

        

        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSp)
        {
            ViewBag.MaPhanLoai = new SelectList(db.PhanLoais.ToList(), "MaPhanLoai", "PhanLoaiChinh");
            ViewBag.MaPhanLoaiPhu = new SelectList(db.PhanLoaiPhus.ToList(), "MaPhanLoaiPhu", "TenPhanLoaiPhu");
            var cauThu = db.SanPhams.Find(maSp);
            return View(cauThu);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                db.Update(sanpham);
                //db.Entry(cauThu).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sanpham);
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