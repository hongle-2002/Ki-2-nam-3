using BaoCao.Models;
using Microsoft.AspNetCore.Mvc;
using BaoCao.Reponsitory;

namespace QuanLySach.ViewComponents
{
    public class LoaiSpMenuViewComponent : ViewComponent
    {
        private readonly ILoaiSpRepository _loaiSp;
        public LoaiSpMenuViewComponent(ILoaiSpRepository loaiSpRepository)
        {
            _loaiSp = loaiSpRepository;
        }

        public IViewComponentResult Invoke()
        {
            var loaiSp = _loaiSp.GetAllLoaiSp().OrderBy(x => x.TenTheLoai);
            return View(loaiSp);
        }
    }
}
