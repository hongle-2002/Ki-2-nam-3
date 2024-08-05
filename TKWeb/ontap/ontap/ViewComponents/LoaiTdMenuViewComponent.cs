using Microsoft.AspNetCore.Mvc;
using ontap.Models;
using ontap.Repository;

namespace ontap.ViewComponents
{
    public class LoaiTdMenuViewComponent : ViewComponent
    {
        private readonly ILoaiTdRepository _loaiTd;
        public LoaiTdMenuViewComponent(ILoaiTdRepository loaiTdRepository)
        {
            _loaiTd = loaiTdRepository;
        }
        public IViewComponentResult Invoke()
        {
            var loaitd = _loaiTd.GetAllLoaiTd().OrderBy(x => x.TranDauId);
            return View(loaitd);
        }
    }
}
