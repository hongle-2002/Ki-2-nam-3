using WebBTL.Models;
using Microsoft.AspNetCore.Mvc;

namespace WebBTL.Controllers
{
	public class AccessController : Controller
	{
		QuanLyThuocContext db = new QuanLyThuocContext();
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
		public IActionResult Login(TUser user)
		{
			if (HttpContext.Session.GetString("UserName") == null)
			{
				var u = db.TUsers.Where(x => x.Username == user.Username &&
				x.Password == user.Password).FirstOrDefault();
				if (u != null)
				{
					HttpContext.Session.SetString("UserName", u.Username.ToString());
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
