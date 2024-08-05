using BaoCao.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

using X.PagedList;

namespace QuanLySach.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QlsachContext db = new QlsachContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {

            return View();
        }
        [Route("TimKiem")]
        public IActionResult TimKiem(int? page, string SearchString)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.Saches.AsNoTracking().Where(x => x.TenSach.Contains(SearchString));
            PagedList<Sach> list = new PagedList<Sach>(lstsanpham, pageNumber, pageSize);
            ViewBag.SearchString = SearchString;
            return View(list);
        }
        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.Saches.AsNoTracking().OrderBy(x => x.TenSach);

            PagedList<Sach> list = new PagedList<Sach>(lstsanpham, pageNumber, pageSize);
            return View(list);
        }


        [Route("ThemSanPhamMoi")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi()
        {
            ViewBag.MaNxb = new SelectList(db.NhaXuatBans.ToList(), "MaNxb", "TenNxb");
            ViewBag.MaNxh = new SelectList(db.NhaPhatHanhs.ToList(), "MaNph", "TenNph");
            ViewBag.MaTheLoai = new SelectList(db.TheLoais.ToList(), "MaTheLoai", "TenTheLoai");
            return View();
        }
        [Route("ThemSanPhamMoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(Sach sach)
        {
            if (ModelState.IsValid)
            {
                db.Saches.Add(sach);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sach);
        }

        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSanPham)
        {
            ViewBag.MaNxb = new SelectList(db.NhaXuatBans.ToList(), "MaNxb", "TenNxb");
            ViewBag.MaNxh = new SelectList(db.NhaPhatHanhs.ToList(), "MaNph", "TenNph");
            ViewBag.MaTheLoai = new SelectList(db.TheLoais.ToList(), "MaTheLoai", "TenTheLoai");
            var sanPham = db.Saches.Find(maSanPham);
            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(Sach sach)
        {
            if (ModelState.IsValid)
            {
                // db.Update(sach);
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            return View(sach);
        }
        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSanPham)
        {
            TempData["Message"] = "";
            var chiTietSanPham = db.ChiTietSaches.Where(x => x.MaSach == maSanPham).ToList();
            if (chiTietSanPham.Count() > 0)
            {
                TempData["Message"] = "Khong duoc xoa san pham nay ";
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");

            }
            var anhSanPham = db.AnhSaches.Where(x => x.MaSach == maSanPham);
            if (anhSanPham.Any()) db.RemoveRange(anhSanPham);
            db.Remove(db.Saches.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "San pham nay da duoc xoa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }





        // nhân viên
        [Route("danhsachnhanvien")]
        public IActionResult DanhSachNhanVien()
        {
            var lstnv = db.NhanViens.AsNoTracking().OrderBy(x => x.TenNv);
            return View(lstnv);
        }
        //thêm nv
        [Route("ThemNhanVien")]
        [HttpGet]
        public IActionResult ThemNhanVien()
        {
            ViewBag.Username = new SelectList(db.Usernames.ToList(), "Username1", "Password");
            return View();
        }

        [Route("ThemNhanVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemNhanVien(NhanVien nhanvien)
        {
            if (ModelState.IsValid)
            {
                db.NhanViens.Add(nhanvien);
                db.SaveChanges();
                return RedirectToAction("DanhSachNhanVien");
            }
            return View(nhanvien);
        }

        //sửa nv

        [Route("SuaNhanVien")]
        [HttpGet]
        public IActionResult SuaNhanVien(string manv)
        {
            ViewBag.Username = new SelectList(db.Usernames.ToList(), "Username1", "Password");
            var nhanvien = db.NhanViens.Find(manv);
            return View();
        }

        [Route("SuaNhanVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaNhanVien(NhanVien nhanvien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhanvien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhSachNhanVien", "HomeAdmin");
            }
            return View(nhanvien);
        }
        // xoa nv
        [Route("XoaNhanVien")]
        [HttpGet]
        public IActionResult XoaNhanVien(string manv)
        {

            TempData["Message"] = "";
            db.Remove(db.NhanViens.Find(manv));
            db.SaveChanges();
            TempData["Message"] = "Đã xoá nhân viên thành công";

            return RedirectToAction("DanhSachNhanVien");

        }



        // khach hang

        [Route("danhsachkhachhang")]
        public IActionResult DanhSachKhachHang()
        {
            var lstkh = db.KhachHangs.AsNoTracking().OrderBy(x => x.TenKh);
            return View(lstkh);
        }
        //thêm nv
        [Route("ThemKH")]
        [HttpGet]
        public IActionResult ThemKH()
        {
            ViewBag.Username = new SelectList(db.Usernames.ToList(), "Username1", "Password");
            return View();
        }

        [Route("ThemKH")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemKH(KhachHang khachhang)
        {
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(khachhang);
                db.SaveChanges();
                return RedirectToAction("DanhSachKhachHang");
            }
            return View(khachhang);
        }

        //sửa nv

        [Route("SuaKH")]
        [HttpGet]
        public IActionResult SuaKH(string makh)
        {
            ViewBag.Username = new SelectList(db.Usernames.ToList(), "Username1", "Password");
            var khachhang = db.KhachHangs.Find(makh);
            return View();
        }

        [Route("SuaKH")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaKH(KhachHang khachhang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(khachhang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhSachKhachHang", "HomeAdmin");
            }
            return View(khachhang);
        }
        // xoa nv
        [Route("XoaKH")]
        [HttpGet]
        public IActionResult XoaKH(string makh)
        {

            TempData["Message"] = "";
            db.Remove(db.KhachHangs.Find(makh));
            db.SaveChanges();
            TempData["Message"] = "Đã xoá khach hang thành công";

            return RedirectToAction("DanhSachKhachHang");

        }

        // user
        [Route("danhsachuser")]
        public IActionResult DanhSachUser()
        {
            var lstuser = db.Usernames.AsNoTracking().OrderBy(x => x.Username1);
            return View(lstuser);
        }
        // them user
        [Route("ThemUser")]
        [HttpGet]
        public IActionResult ThemUser()
        {
           
            return View();
        }

        [Route("ThemUser")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemUser(Username user)
        {
            if (ModelState.IsValid)
            {
                db.Usernames.Add(user);
                db.SaveChanges();
                return RedirectToAction("DanhSachUser");
            }
            return View(user);
        }


              //sửa nv

              [Route("SuaUser")]
              [HttpGet]
              public IActionResult SuaUser(string user)
              {

                  var users = db.Usernames.Find(user);
                  return View();
              }

              [Route("SuaUser")]
              [HttpPost]
              [ValidateAntiForgeryToken]
              public IActionResult SuaUser(Username user)
              {
                  if (ModelState.IsValid)
                  {
                      db.Entry(user).State = EntityState.Modified;
                      db.SaveChanges();
                      return RedirectToAction("DanhSachUser", "HomeAdmin");
                  }
                  return View(user);
              }
                  // xoa user
                  [Route("XoaUser")]
                  [HttpGet]
                  public IActionResult XoaUser(string mauser)
                  {

                      TempData["Message"] = "";
                        db.Remove(db.Usernames.Find(mauser));
                        db.SaveChanges();
                      TempData["Message"] = "Đã xoá user thành công";

                      return RedirectToAction("DanhSachUser");

                      }
            // nhà xuat ban
        [Route("danhsachnxb")]
        public IActionResult DanhSachNXB()
        {
            var lstnxb = db.NhaXuatBans.AsNoTracking().OrderBy(x => x.MaNxb);
            return View(lstnxb);
        }

        // them nxb
        [Route("ThemNXB")]
        [HttpGet]
        public IActionResult ThemNXB()
        {

            return View();
        }

        [Route("ThemNXB")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemNXB(NhaXuatBan nxb)
        {
            if (ModelState.IsValid)
            {
                db.NhaXuatBans.Add(nxb);
                db.SaveChanges();
                return RedirectToAction("DanhSachNXB");
            }
            return View(nxb);
        }

        //sửa nxb

        [Route("SuaNXB")]
        [HttpGet]
        public IActionResult SuaNXB(string manxb)
        {

            var users = db.Usernames.Find(manxb);
            return View();
        }

        [Route("SuaNXB")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaNXB(NhaXuatBan nxb)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nxb).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhSachNXB", "HomeAdmin");
            }
            return View(nxb);
        }
        // xoa user
        [Route("XoaNXB")]
        [HttpGet]
        public IActionResult XoaNXB(string nxb)
        {

            TempData["Message"] = "";
            db.Remove(db.NhaXuatBans.Find(nxb));
            db.SaveChanges();
            TempData["Message"] = "Đã xoá NXB thành công";

            return RedirectToAction("DanhSachNXB");

        }

        // nhà phat hanh
        [Route("danhsachnph")]
        public IActionResult DanhSachNPH()
        {
            var lstnph = db.NhaPhatHanhs.AsNoTracking().OrderBy(x => x.MaNph);
            return View(lstnph);
        }

    }
   
}


