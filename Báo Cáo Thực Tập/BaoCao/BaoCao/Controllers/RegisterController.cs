using Microsoft.AspNetCore.Mvc;
using BaoCao.Models;
namespace BaoCao.Controllers
{
    public class RegisterController : Controller
    {
        QlsachContext db = new QlsachContext();
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(Username user)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem tên đăng nhập đã được sử dụng chưa
                if (HttpContext.Session.GetString(user.Username1) != null)
                {
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập đã tồn tại");
                    return View(user);
                }
                else
                {
                    db.Add(user);
                    db.SaveChanges();
                    // Đăng nhập người dùng và chuyển hướng đến trang chủ
                    HttpContext.Session.SetString("UserName", user.Username1.ToString());
                    //return RedirectToAction("Index", "Home");
                    return RedirectToAction("Login", "Access");
                }
            }
            // Trả về View với model và thông tin lỗi (nếu có)
            return View(user);
        }
    }
}
