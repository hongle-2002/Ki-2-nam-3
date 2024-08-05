using WebBTL.Models;
namespace WebBTL.Repository
{
    public interface ILoaiSpRepository
    {
        TLoaiThuoc Add(TLoaiThuoc loaiSp);
        TLoaiThuoc Update(TLoaiThuoc loaiSp);
        TLoaiThuoc Delete(String maloaiSp);
        TLoaiThuoc GetLoaiSp(String maloaiSp);
        IEnumerable<TLoaiThuoc> GetAllLoaiSp();

    }
}
