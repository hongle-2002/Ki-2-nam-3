using hehe.Models;
namespace hehe.Repository
{
    public interface ILoaiSpRepository
    {
        Caulacbo Add(Caulacbo caulacbo);
        Caulacbo Update(Caulacbo caulacbo);

        Caulacbo Delete(String macaulacbo);
        Caulacbo GetLoaiSp(String macaulacbo);
        IEnumerable<Caulacbo> GetAllLoaiSp();
    }
}
