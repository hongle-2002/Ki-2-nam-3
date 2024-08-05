using Microsoft.AspNetCore.Mvc;
using template6.Models;
using template6.Repository;
namespace template6.ViewComponents
{
	public class LoaiSpMenuViewComponent: ViewComponent
	{
		private readonly ILoaiSpRepository _loaiSp;
		public LoaiSpMenuViewComponent(ILoaiSpRepository loaiSpRepository)
		{
			_loaiSp = loaiSpRepository;
		}
		public IViewComponentResult Invoke()
		{
			var AllLoaiSp = _loaiSp.GetAllLoaiSp().OrderBy(x => x.MaPhanLoai);
			return View(AllLoaiSp);
		}

	}
}
