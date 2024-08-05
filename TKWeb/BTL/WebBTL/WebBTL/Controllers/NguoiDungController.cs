using Microsoft.AspNetCore.Mvc;
using WebBTL.Models;

namespace WebBTL.Controllers
{
    public class NguoiDungController : Controller
    {
        public IActionResult Index()
        {
            QuanLyThuocContext db = new QuanLyThuocContext();
            List<TUser> users = db.TUsers.ToList();
            return View(users);
        }
    }
}
