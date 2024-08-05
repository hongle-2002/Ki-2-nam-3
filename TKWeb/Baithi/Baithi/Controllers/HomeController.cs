using Baithi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Diagnostics;

namespace Baithi.Controllers
{
	public class HomeController : Controller
	{
		QlbanHangMuContext db = new QlbanHangMuContext();
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
			List<SanPham> lstsanpham = db.SanPhams.Where(x => x.MaPhanLoai == MaLoai).OrderBy(x => x.TenSanPham).ToList();
			return View(lstsanpham);
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