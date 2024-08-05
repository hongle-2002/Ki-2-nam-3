using Tai.Models;

namespace Tai.ViewModel
{
    public class HomeProductDetailViewModel
    {
        private TDanhMucSp? sanPham;
        private List<TAnhSp> anhSanPham;


        public TDanhMucSp danhMucSp { get; set; }
        public List<TAnhSp> anhSps { get; set; }
    }
}
