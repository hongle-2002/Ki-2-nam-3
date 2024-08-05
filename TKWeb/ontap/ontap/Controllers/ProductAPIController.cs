using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ontap.Models;
using ontap.Models.ProductModels;

namespace ontap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {
        QlbongDaContext db = new QlbongDaContext();
        [HttpGet]
        public IEnumerable<Product> GetAllProducts()
        {
            var trandau = (from p in db.TrandauCauthus
                           select new Product
                           {
                               TranDauId = p.TranDauId,
                               CauThuId = p.CauThuId,
                           }).ToList();
            return trandau;
        }

        [HttpGet("{TranDauID}")]
        public IEnumerable<Cauthu> GetCauThuTheoTran(string tranDauId)
        {
            var trandauCauThus = (from tdct in db.TrandauCauthus
                                  join ct in db.Cauthus on tdct.CauThuId equals ct.CauThuId
                                  where tdct.TranDauId == tranDauId
                                  select new Cauthu
                                  {
                                      CauThuId = ct.CauThuId,
                                      HoVaTen = ct.HoVaTen,
                                      Ngaysinh = ct.Ngaysinh,

                                      // các thuộc tính khác của đối tượng CauThu
                                  }).ToList();
            return trandauCauThus;
        }

    }
}
