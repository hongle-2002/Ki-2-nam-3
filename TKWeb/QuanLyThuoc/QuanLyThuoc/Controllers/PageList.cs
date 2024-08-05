using QuanLyThuoc.Models;
using X.PagedList;

namespace QuanLyThuoc.Controllers
{
    internal class PageList<T> : PagedList<TDanhMucThuoc>
    {
        public PageList(IEnumerable<TDanhMucThuoc> superset, int pageNumber, int pageSize) : base(superset, pageNumber, pageSize)
        {
        }
    }
}