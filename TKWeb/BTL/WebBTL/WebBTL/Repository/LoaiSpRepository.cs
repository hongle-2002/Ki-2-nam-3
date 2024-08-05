using WebBTL.Models;
namespace WebBTL.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository
    {
        private readonly QuanLyThuocContext _context;
        public LoaiSpRepository(QuanLyThuocContext context)
        {
            _context = context;
        }
        public TLoaiThuoc Add(TLoaiThuoc loaiSp)
        {
          _context.TLoaiThuocs.Add(loaiSp);
            _context.SaveChanges();
            return loaiSp;
        }

        public TLoaiThuoc Delete(string maloaiSp)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TLoaiThuoc> GetAllLoaiSp()
        {
            return _context.TLoaiThuocs;
        }

        public TLoaiThuoc GetLoaiSp(string maloaiSp)
        {
            return _context.TLoaiThuocs.Find(maloaiSp);
        }

        public TLoaiThuoc Update(TLoaiThuoc loaiSp)
        {
           _context.Update(loaiSp);
            _context.SaveChanges();
            return loaiSp;
        }
    }
}
