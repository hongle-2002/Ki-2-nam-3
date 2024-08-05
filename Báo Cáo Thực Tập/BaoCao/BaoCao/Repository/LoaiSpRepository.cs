using BaoCao.Models;
using BaoCao.Reponsitory;

namespace QuanLySach.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository
    {
        private readonly QlsachContext _context;
        public LoaiSpRepository(QlsachContext context)
        {
            _context = context;
        }
        public TheLoai Add(TheLoai theLoai)
        {
            _context.TheLoais.Add(theLoai);
            _context.SaveChanges();
            return theLoai;
        }

        public TheLoai Delete(string matheloai)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TheLoai> GetAllLoaiSp()
        {
            return _context.TheLoais;
        }

        public TheLoai GetTheLoai(string matheloai)
        {
            return _context.TheLoais.Find(matheloai);
        }

        public TheLoai Update(TheLoai theLoai)
        {
            _context.Update(theLoai);
            _context.SaveChanges();
            return theLoai;
        }
    }
}
