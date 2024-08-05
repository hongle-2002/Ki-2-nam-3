using QuanAo.Models;
namespace QuanAo.Repository
{
    public interface ILoaiSpRepository
    {
        PhanLoai Add(PhanLoai phanLoai);
        PhanLoai Update(PhanLoai phanLoai);
        PhanLoai Delete(String maPhanloai);
        PhanLoai GetLoaiSp(String maPhanloai);
        IEnumerable<PhanLoai> GetAllLoaiSp();
    }
}
