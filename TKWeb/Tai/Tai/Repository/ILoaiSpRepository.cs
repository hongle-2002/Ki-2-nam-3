using Tai.Models;

namespace Tai.Repository
{
    public interface ILoaiSpRepository
    {
        TLoaiSp Add(TLoaiSp loaiSp);
        TLoaiSp Update(TLoaiSp loaiSp);
        TLoaiSp Delete(string loaiSp);
        TLoaiSp GetLoaiSp(string MaLoai);
        IEnumerable<TLoaiSp> GetAllLoaiSp();
    }
}
