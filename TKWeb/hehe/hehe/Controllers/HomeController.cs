using hehe.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Diagnostics;

namespace hehe.Controllers
{
    public class HomeController : Controller
    {
        QlbongDaContext db = new QlbongDaContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            var lstcauthu = db.Cauthus.ToList();

            return View(lstcauthu);
        }
        public IActionResult CauThuTheoCLB( String macaulacbo)
        {
            List<Cauthu> lstcauthu = db.Cauthus.Where(x=>x.CauLacBoId== macaulacbo).OrderBy(x=>x.HoVaTen).ToList();
            return View(lstcauthu);
        }
        [Route("ThemCauThu")]
        [HttpGet]
        public IActionResult ThemCauThu()
        {
            ViewBag.CauLacBoId = new SelectList(db.Caulacbos.ToList(), "CauLacBoId", "TenClb");
            return View();
        }
        [Route("ThemCauThu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemCauThu(Cauthu cauThu)
        {
            if(ModelState.IsValid)
            {
                db.Cauthus.Add(cauThu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cauThu);
        }

        [Route("SuaCauThu")]
        [HttpGet]
        public IActionResult SuaCauThu(string maCauThu)
        {
            ViewBag.CauLacBoId = new SelectList(db.Caulacbos.ToList(), "CauLacBoId", "TenClb");
            var cauThu = db.Cauthus.Find(maCauThu);
            return View(cauThu);
        }
        [Route("SuaCauThu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaCauThu(Cauthu cauThu)
        {
            if (ModelState.IsValid)
            {
                db.Update(cauThu);
                //db.Entry(cauThu).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cauThu);
        }

        public IActionResult ChiTietCauThu(string maCauThu)
        {
            var cauThu = db.Cauthus.SingleOrDefault(x=>x.CauThuId == maCauThu);
            
            return View(maCauThu);
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