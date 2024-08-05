using hehe.Models;

namespace hehe.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository
    {
        private readonly QlbongDaContext _context;
        public LoaiSpRepository(QlbongDaContext context)
        {
            _context = context;
        }
        public Caulacbo Add(Caulacbo caulacbo)
        {
            _context.Caulacbos.Add(caulacbo);
            _context.SaveChanges();
            return caulacbo;
        }

        public Caulacbo Delete(string macaulacbo)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Caulacbo> GetAllLoaiSp()
        {
            return _context.Caulacbos.Take(5);
        }

        public Caulacbo GetLoaiSp(string macaulacbo)
        {
            return _context.Caulacbos.Find(macaulacbo);
        }

        public Caulacbo Update(Caulacbo caulacbo)
        {
            _context.Update(caulacbo);
            _context.SaveChanges();
            return caulacbo;
        }
    }
}
