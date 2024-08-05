using Tai.Models;

namespace Tai.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository
    {
        private readonly QlbanVaLiContext _context;
        public LoaiSpRepository(QlbanVaLiContext context)
        {
            _context = context;
        }
        public TLoaiSp Add(TLoaiSp loaiSp)
        {
            throw new NotImplementedException();
        }

        public TLoaiSp Delete(string loaiSp)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TLoaiSp> GetAllLoaiSp()
        {
            
            return _context.TLoaiSps;
        }

        public TLoaiSp GetLoaiSp(string MaLoai)
        {
            return _context.TLoaiSps.Find(MaLoai);
        }

        public TLoaiSp Update(TLoaiSp loaiSp)
        {
            throw new NotImplementedException();
        }
    }
}
