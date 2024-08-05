using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using WebBTL.Models;
using WebBTL.Models.Authentication;
using WebBTL.ViewModels;
using X.PagedList;

namespace WebBTL.Controllers
{
    public class HomeController : Controller
    {
        QuanLyThuocContext db = new QuanLyThuocContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        //[Authentication]

        public IActionResult Index(int? page)
        {/*
            if(SearchString != "")
            {
                var sanpham = db.TDanhMucThuocs.Include(s => s.TenThuoc).Where(x => x.TenThuoc.ToUpper().Contains(SearchString.ToUpper()));
                return View(sanpham.ToList());
            }*/
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.TDanhMucThuocs.AsNoTracking().OrderBy(x => x.TenThuoc);
            PagedList<TDanhMucThuoc> list = new PagedList<TDanhMucThuoc>(lstsanpham, pageNumber, pageSize);
            return View(list);
        }

        public IActionResult SanPhamTheoLoai(String maloai, int? page)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var lstsanpham = db.TDanhMucThuocs.AsNoTracking().Where(x => x.MaLoai == maloai).OrderBy(x => x.TenThuoc);
            PagedList<TDanhMucThuoc> list = new PagedList<TDanhMucThuoc>(lstsanpham, pageNumber, pageSize);
            ViewBag.maloai = maloai;
            return View(list);
        }


        public IActionResult ChiTietSanPham(String maSp) {
            var sanPham = db.TDanhMucThuocs.SingleOrDefault(x => x.MaThuoc == maSp);
            var anhSanPham = db.TAnhSanPhams.Where(x => x.MaThuoc == maSp).ToList();
            ViewBag.anhSanPham = anhSanPham;
            return View(sanPham);
          
        }

        public IActionResult ProductDetail(string maSp)
        {
            var sanPham = db.TDanhMucThuocs.SingleOrDefault(x => x.MaThuoc == maSp);
            var anhSanPham = db.TAnhSanPhams.Where(x => x.MaThuoc == maSp).ToList();
            var homeProductDetailViewModel = new HomeProductDetailViewModel
            {
                danhMucSp = sanPham,
                anhSps = anhSanPham
            };


            return View(homeProductDetailViewModel);
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