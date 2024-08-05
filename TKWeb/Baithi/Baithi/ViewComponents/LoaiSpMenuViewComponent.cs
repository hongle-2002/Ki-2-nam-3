using Microsoft.AspNetCore.Mvc;
using Baithi.Repository;
using Baithi.Models;
namespace Baithi.ViewComponents
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
