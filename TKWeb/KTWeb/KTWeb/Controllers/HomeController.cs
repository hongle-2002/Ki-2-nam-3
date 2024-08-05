using KTWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace KTWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly IWebHostEnvironment _environment;
        QlbongDaContext _dbContext = new QlbongDaContext();
        private readonly ILogger<HomeController> _logger;
        public HomeController(ILogger<HomeController> logger, IWebHostEnvironment environment)
        {
            _logger = logger;
            _environment = environment;
        }
        public IActionResult Index()
        {
            var query = _dbContext.Cauthus!.Where(x => x.CauLacBoId == "101").OrderBy(x => x.HoVaTen).ToList();
            return View(query);
        }

        public IActionResult GetMaTranDau()
        {
            var query = _dbContext.Trandaus.Take(7).ToList();
            return Json(query);
        }
        public IActionResult GetPlayers(string tranDauId)
        {
            var query = _dbContext.TrandauCauthus.Where(x => x.TranDauId == tranDauId).Select(x => x.CauThuId).ToList();
            var list = _dbContext.Cauthus.Where(x => query.Contains(x.CauThuId)).ToList();
            return Json(list);
        }
        [HttpGet]
        public IActionResult EditPlayer(string CauThuId)
        {
            ViewBag.CauLacBoId = new SelectList(_dbContext.Caulacbos, "CauLacBoId", "TenClb");

            var cauThu = _dbContext.Cauthus.Find(CauThuId);
            return View(cauThu);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditPlayer(Cauthu cauThu)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Entry(cauThu).State = EntityState.Modified;
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(cauThu);
        }
    }
}