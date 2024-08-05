using Azure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebBTL.Models;
using X.PagedList;

namespace WebBTL.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QuanLyThuocContext db = new QuanLyThuocContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index ( )
        {
            return View();
        }

        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page, string SearchString)
        {

            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
           // var lstsanpham = db.TDanhMucThuocs.AsNoTracking().OrderBy(x => x.TenThuoc);
           var lstsanpham = db.TDanhMucThuocs.AsNoTracking().Where(x => x.TenThuoc.Contains(SearchString));

            PagedList<TDanhMucThuoc> list = new PagedList<TDanhMucThuoc>(lstsanpham, pageNumber, pageSize);
            return View(list);
        }

        [Route("ThemSanPhamMoi")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi() {
            ViewBag.MaDvt = new SelectList(db.TDonViTinhs.ToList(), "MaDvt", "TenDvt");
            ViewBag.MaLoai = new SelectList(db.TLoaiThuocs.ToList(), "MaLoai", "TenLoai");
            ViewBag.MaNuocSx = new SelectList(db.TNuocSanXuats.ToList(), "MaNuocSx", "TenNuocSx");
            return View();
        }
        [Route("ThemSanPhamMoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(TDanhMucThuoc sanPham) {
            if(ModelState.IsValid)
            {
                db.TDanhMucThuocs.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }


        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSanPham)
        {
            ViewBag.MaDvt = new SelectList(db.TDonViTinhs.ToList(), "MaDvt", "TenDvt");
            ViewBag.MaLoai = new SelectList(db.TLoaiThuocs.ToList(), "MaLoai", "TenLoai");
            ViewBag.MaNuocSx = new SelectList(db.TNuocSanXuats.ToList(), "MaNuocSx", "TenNuocSx");
            var sanPham = db.TDanhMucThuocs.Find(maSanPham);
            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(TDanhMucThuoc sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            return View(sanPham);
        }


        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSanPham)
        {
            TempData["Message"] = "";
            var chitietThuoc = db.TChiTietSanPhams.Where(x => x.MaThuoc == maSanPham).ToList();
            if (chitietThuoc.Count() > 0)
            {
                TempData["Message"] = "Không xóa được sản phẩm này!";
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            var anhThuoc = db.TAnhSanPhams.Where(x => x.MaThuoc == maSanPham);
            if (anhThuoc.Any()) db.RemoveRange(anhThuoc);
            db.Remove(db.TDanhMucThuocs.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "Thuốc đã được xóa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }
    }
}
