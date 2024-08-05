using QuanAo.Models;

namespace QuanAo.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository

    {
        private readonly QlbanHangQuanAoContext _context;
        public LoaiSpRepository(QlbanHangQuanAoContext context)
        {
            _context = context;
        }
        
        public PhanLoai Add(PhanLoai phanLoai)
        {
            _context.PhanLoais.Add(phanLoai);
            _context.SaveChanges();
            return phanLoai;
        }

        public PhanLoai Delete(string maPhanloai)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<PhanLoai> GetAllLoaiSp()
        {
            return _context.PhanLoais;
        }

        public PhanLoai GetLoaiSp(string maPhanloai)
        {
            return _context.PhanLoais.Find(maPhanloai);
        }

        public PhanLoai Update(PhanLoai phanLoai)
        {
            _context.Update(phanLoai);
            _context.SaveChanges();
            return phanLoai;
        }
    }
}
