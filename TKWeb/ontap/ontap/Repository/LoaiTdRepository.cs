using ontap.Models;

namespace ontap.Repository
{
    public class LoaiTdRepository : ILoaiTdRepository
    {
        private readonly QlbongDaContext _context;
        public LoaiTdRepository(QlbongDaContext context)
        {
            _context = context;
        }
        public Trandau Add(Trandau trandau)
        {
            _context.Trandaus.Add(trandau);
            _context.SaveChanges();
            return trandau;
        }

        public Trandau Delete(string matrandau)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Trandau> GetAllLoaiTd()
        {

            return _context.Trandaus.Take(7);
        }

        public Trandau GetLoaiTd(string matrandau)
        {
            return _context.Trandaus.Find(matrandau);
        }

        public Trandau Update(Trandau trandau)
        {
            _context.Update(trandau);
            _context.SaveChanges();
            return trandau;
        }
    }
}
