using template6.Models;
namespace template6.Repository
{
	public interface ILoaiSpRepository
	{
		PhanLoai Add(PhanLoai phanLoai);
		PhanLoai Update(PhanLoai phanLoai);
		PhanLoai Delete(String maloaiSp);
		PhanLoai GetLoaiSp(String maloaiSp);
		IEnumerable<PhanLoai> GetAllLoaiSp();
	}
}
