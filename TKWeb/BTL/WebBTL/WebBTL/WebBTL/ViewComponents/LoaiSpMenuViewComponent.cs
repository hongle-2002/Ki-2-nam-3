using Microsoft.AspNetCore.Mvc;
using WebBTL.Models;
using WebBTL.Repository;

namespace WebBTL.ViewComponents
{
    public class LoaiSpMenuViewComponent :ViewComponent
    {
        private readonly ILoaiSpRepository _loaiSp;
        public LoaiSpMenuViewComponent(ILoaiSpRepository loaiSpRespository)
        {
            _loaiSp = loaiSpRespository;
        }
        public IViewComponentResult Invoke()
        {
            var loaisp = _loaiSp.GetAllLoaiSp().OrderBy(x => x.TenLoai);

            return View(loaisp);
        }
    }
}
