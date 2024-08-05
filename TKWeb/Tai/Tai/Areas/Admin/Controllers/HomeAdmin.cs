using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using Tai.Models;
using X.PagedList;

namespace Tai.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin/homeadmin")]
    [Route("admin")]
    public class HomeAdmin : Controller
    {
        QlbanVaLiContext db = new QlbanVaLiContext();
        [Route("index")]
        [Route("")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 6;
            var lstsanpham = db.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> lst = new PagedList<TDanhMucSp>(lstsanpham, pageNumber, pageSize);
            return View(lst);
        }
        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSp)
        {
            ViewBag.MaChatLieu = new SelectList(db.TChatLieus, "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(db.THangSxes, "MaHangSx", "HangSx");
            ViewBag.MaNuoc = new SelectList(db.TQuocGia, "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps, "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(db.TLoaiDts, "MaDt", "TenLoai");

            TDanhMucSp sanPham = db.TDanhMucSps.Find(maSp);

            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(TDanhMucSp sanPham)
        {
            if(ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }

        [Route("ThemSanPham")]
        [HttpGet]

        public IActionResult ThemSanPham()
        {
            ViewBag.MaChatLieu = new SelectList(db.TChatLieus, "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(db.THangSxes, "MaHangSx", "HangSx");
            ViewBag.MaNuoc = new SelectList(db.TQuocGia, "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps, "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(db.TLoaiDts, "MaDt", "TenLoai");


            return View();

        }[Route("ThemSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPham(TDanhMucSp sanPham)
        {
            db.TDanhMucSps.Add(sanPham);
            db.SaveChanges();
            return RedirectToAction("DanhMucSanPham");
        }

        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSp)
        {
            TempData["Message"] = "";
            var chiTietSp = db.TChiTietSanPhams.Where(x=>x.MaSp == maSp).ToList();
            if(chiTietSp.Count() >0)
            {
                TempData["Message"] = "Khong duoc xoa san pham nay";
                return RedirectToAction("Danhmucsanpham", "HomeAdmin");

            }
            var anhSp = db.TAnhSps.Where(x => x.MaSp == maSp);
            if (anhSp.Any()) db.RemoveRange(anhSp);
            db.Remove(db.TDanhMucSps.Find(maSp));
            db.SaveChanges();
            TempData["Message"] = "Da xoa san pham thanh cong";
            return RedirectToAction("Danhmucsanpham", "HomeAmin");
        }

    }
}
