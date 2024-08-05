using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using BaoCao.Helpers;
using BaoCao.Models;

namespace BaoCao.Controllers
{
    public class GioHangController : Controller
    {
        private readonly QlsachContext _context;
        public GioHangController(QlsachContext context)
        {
            _context = context;
        }

        public List<GioHang> GioHang
        {
            get
            {
                var data = HttpContext.Session.Get<List<GioHang>>("GioHang");
                if(data == null)
                {
                    data = new List<GioHang>();
                }
                return data;
            }
        }


        public IActionResult Index()
        {
            return View(GioHang);
        }

        public IActionResult AddToCart(String id)
        {
            var myCart = GioHang;
            var item = myCart.SingleOrDefault(p => p.MaSach == id );
            if(item == null) // chua co
            {
                var hanghoa = _context.Saches.SingleOrDefault(x => x.MaSach == id);
                item = new GioHang
                {
                    MaSach = id,
                    TenSach = hanghoa.TenSach,
                    DonGia = (float)hanghoa.GiaNhoNhat,
                    SoLuong = 1,
                    Hinh = hanghoa.Anh
                    
                   
                };
                myCart.Add(item);
            }
            else
            {
                item.SoLuong++;
            }
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction("Index");
        }
    }
}
