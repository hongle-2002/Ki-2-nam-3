using ontap.Models;

namespace ontap.Repository
{
    public interface ILoaiTdRepository
    {
        Trandau Add(Trandau trandau);
        Trandau Update(Trandau trandau);
        Trandau Delete(string matrandau);

        Trandau GetLoaiTd(string matrandau);
        IEnumerable<Trandau> GetAllLoaiTd();
    }
}
