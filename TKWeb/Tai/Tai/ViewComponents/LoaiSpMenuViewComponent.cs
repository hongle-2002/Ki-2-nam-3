
using Microsoft.AspNetCore.Mvc;
using Tai.Repository;

namespace Tai.ViewComponents
{
    public class LoaiSpMenuViewComponent: ViewComponent
    {
        private readonly ILoaiSpRepository _loaiSpRepository;
        public LoaiSpMenuViewComponent(ILoaiSpRepository loaiSpRepository)
        {
            _loaiSpRepository= loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var loaisps = _loaiSpRepository.GetAllLoaiSp().OrderBy(x => x.Loai);
            return View(loaisps);
        }
    }
}
