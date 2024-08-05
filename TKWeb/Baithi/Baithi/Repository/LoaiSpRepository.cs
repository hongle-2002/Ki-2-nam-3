using Baithi.Models;

namespace Baithi.Repository
{
	public class LoaiSpRepository : ILoaiSpRepository
	{
		private readonly QlbanHangMuContext _context;
		public LoaiSpRepository(QlbanHangMuContext context)
		{
			_context = context;
		}

		public PhanLoai Add(PhanLoai phanLoai)
		{
			_context.PhanLoais.Add(phanLoai);
			_context.SaveChanges();
			return phanLoai;
		}

		public PhanLoai Delete(string maloaiSp)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<PhanLoai> GetAllLoaiSp()
		{
			return _context.PhanLoais;
		}

		public PhanLoai GetLoaiSp(string maloaiSp)
		{
			return _context.PhanLoais.Find(maloaiSp);
		}

		public PhanLoai Update(PhanLoai phanLoai)
		{
			_context.Update(phanLoai);
			_context.SaveChanges();
			return phanLoai;
		}
	}
}
