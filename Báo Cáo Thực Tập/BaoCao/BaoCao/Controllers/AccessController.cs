using BaoCao.Models;
using Microsoft.AspNetCore.Mvc;

namespace QuanLySach.Controllers
{
    public class AccessController : Controller
    {
        QlsachContext db = new QlsachContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Login(Username user)
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                var u = db.Usernames.Where(x => x.Username1 == user.Username1 &&
                x.Password == user.Password).FirstOrDefault();

                if (u != null)
                {
                    HttpContext.Session.SetString("UserName", u.Username1.ToString());
                    /*return RedirectToAction("DanhMucSanPham", "Admin");*/
                    if (u.LoaiUser == 1)
                    {
                        return RedirectToAction("DanhMucSanPham", "Admin");
                    }
                    return RedirectToAction("Index", "Home");
                }
            }
            return View(user);
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("UserName");
            return RedirectToAction("Login", "Access");
        }
    }
}
