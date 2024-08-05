using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebBTL.Models;
using WebBTL.Models.ProductModels;

namespace WebBTL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {
        QuanLyThuocContext db = new QuanLyThuocContext();
        [HttpGet]
        public IEnumerable<Product> GetAllProducts()
        {
            var sanPham = (from p in db.TDanhMucThuocs select new Product
            {
                MaThuoc = p.MaThuoc,
                TenThuoc = p.TenThuoc,
                MaLoai = p.MaLoai,
                AnhDaiDien = p.AnhDaiDien,
                GiaLonNhat = p.GiaLonNhat
            }).ToList();
            return sanPham;
        }
        [HttpGet("{maloai}")]
        public IEnumerable<Product> GetProductsByCategory(string maLoai)
        {
            var sanPham = (from p in db.TDanhMucThuocs
                           where p.MaLoai == maLoai 
                           select new Product
                           {
                               MaThuoc = p.MaThuoc,
                               TenThuoc = p.TenThuoc,
                               MaLoai = p.MaLoai,
                               AnhDaiDien = p.AnhDaiDien,
                               GiaLonNhat = p.GiaLonNhat
                           }).ToList();
            return sanPham;
        }
    }
}
