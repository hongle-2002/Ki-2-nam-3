using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Diagnostics;
using template6.Models;

namespace template6.Controllers
{
    public class HomeController : Controller
    {
        QlbanChauCanhContext db = new QlbanChauCanhContext();
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
        public IActionResult SanPhamThemLoai(string MaLoai)
        {
            List<SanPham> lstsanpham= db.SanPhams.Where(x=>x.MaPhanLoai==MaLoai).OrderBy(x=>x.TenSanPham).ToList();
            return View(lstsanpham);
        }
        public IActionResult ChiTietSanPham(string maSp)
        {
            var sanPham = db.SanPhams.SingleOrDefault(x=>x.MaSanPham==maSp);
            return View(sanPham);
        }
		[Route("SuaSanPham")]
		[HttpGet]
		public IActionResult SuaSanPham(string maSp)
		{
			ViewBag.MaPhanLoai = new SelectList(db.PhanLoais.ToList(), "MaPhanLoai", "PhanLoaiChinh");
			ViewBag.MaPhanLoaiPhu = new SelectList(db.PhanLoaiPhus.ToList(), "MaPhanLoaiPhu", "TenPhanLoaiPhu");

			var sanpham = db.SanPhams.Find(maSp);
			return View(sanpham);
		}

		[Route("SuaSanPham")]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult SuaSanPham(SanPham sanpham)
		{
			if (ModelState.IsValid)
			{
				db.Update(sanpham);
				/*csdl.Entry(sanpham).State = EntityState.Modified;*/
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(sanpham);
		}

		[Route("ThemSanPham")]
		[HttpGet]
		public IActionResult ThemSanPham(string maSp)
		{
			ViewBag.MaPhanLoai = new SelectList(db.PhanLoais.ToList(), "MaPhanLoai", "PhanLoaiChinh");
			ViewBag.MaPhanLoaiPhu = new SelectList(db.PhanLoaiPhus.ToList(), "MaPhanLoaiPhu", "TenPhanLoaiPhu");

			
			return View();
		}

		[Route("ThemSanPham")]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult ThemSanPham(SanPham sanpham)
		{
			if (ModelState.IsValid)
			{
				db.SanPhams.Add(sanpham);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(sanpham);
		}

		[Route("XoaSanPham")]
		[HttpGet]
		public IActionResult XoaSanPham(string maSp)
		{
			TempData["Message"] = "";
			var chiTietSp = db.SptheoMaus.Where(x => x.MaSanPham == maSp).ToList();
			if (chiTietSp.Count() > 0)
			{
				TempData["Message"] = "Không xoá được sản phẩm này";
				return RedirectToAction("Index");
			}
			
			db.Remove(db.SanPhams.Find(maSp));
			db.SaveChanges();
			TempData["Message"] = "Đã xoá sản phẩm thành công";
			return RedirectToAction("Index");

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