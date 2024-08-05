using Buoi2.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Buoi2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewData["Message"] = "Trang Trau";
            ViewData["CurrentTime"] = DateTime.Now;
            ViewBag.Message1 = "Hom Nay Dep Troi";
            ViewBag.Year = 2023;
            TempData["YeuCau"] = "Yeu cau cac thanh nien ";
            return RedirectToAction("Privacy");
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