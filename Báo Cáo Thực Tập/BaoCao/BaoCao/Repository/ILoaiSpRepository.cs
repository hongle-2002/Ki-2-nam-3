using BaoCao.Models;
namespace BaoCao.Reponsitory
{
    public interface ILoaiSpRepository
    {
        TheLoai Add(TheLoai theLoai);
        TheLoai Update(TheLoai theLoai);
        TheLoai Delete(String matheloai);
        TheLoai GetTheLoai(String matheloai);
        IEnumerable<TheLoai> GetAllLoaiSp();
    }
}
