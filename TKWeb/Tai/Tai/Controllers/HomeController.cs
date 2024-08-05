using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using Tai.Models;
using Tai.ViewModel;
using X.PagedList;

namespace Tai.Controllers
{
    

    public class HomeController : Controller
    {
        QlbanVaLiContext db = new QlbanVaLiContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        // phân trang 
        /*public IActionResult Index(int? page)
        {
            //home/sanphamtheoloai?maloai=vali (tui,balo,vi)
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            int pageSize = 8;
            var lstsanpham = db.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> lst = new PagedList<TDanhMucSp>(lstsanpham, pageNumber, pageSize);
            return View(lst);
        }*/
       
     //   [Authentication]
      
        public IActionResult Index(int? page)
        {
            //home/sanphamtheoloai?maloai=vali (tui,balo,vi)
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            int pageSize = 8;
            var lstsanpham = db.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> lst = new PagedList<TDanhMucSp>(lstsanpham, pageNumber, pageSize);
            return View(lst);
        }
        //componet : giong partial view nhuwng mạnh mẽ hon, những chức năng phức tạp thì dùng compenet: menu, giỏ hàng,....
        public IActionResult SanPhamTheoLoai(string maloai ,int? page)
        {
            //home/sanphamtheoloai?maloai=vali (tui,balo,vi)
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            int pageSize = 8;
            var lstsanpham = db.TDanhMucSps.AsNoTracking().Where(x => x.MaLoai == maloai).OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> lst = new PagedList<TDanhMucSp>
                (lstsanpham, pageNumber, pageSize);
            ViewBag.maloai = maloai;
            return View(lst);
            /*
                        List<TDanhMucSp> lstsanpham = db.TDanhMucSps.Where(x => x.MaLoai == MaLoai).OrderBy(x => x.TenSp).ToList();
                        return View(lstsanpham);*/
        }
        
        public IActionResult ChiTietSanPham(String maSp)
        {
            var sanPham = db.TDanhMucSps.SingleOrDefault(x => x.MaSp== maSp);
            var anhSanPham = db.TAnhSps.Where(x => x.MaSp == maSp).ToList();
            ViewBag.anhSanPham = anhSanPham;
            return View(sanPham);
        }
        public IActionResult ProductDetail(string maSp)
        {
            var sanPham = db.TDanhMucSps.SingleOrDefault(x => x.MaSp == maSp);
            var anhSanPham = db.TAnhSps.Where(x => x.MaSp == maSp).ToList();
            var homeProductDetailViewModel = new HomeProductDetailViewModel { danhMucSp= sanPham, anhSps= anhSanPham };
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