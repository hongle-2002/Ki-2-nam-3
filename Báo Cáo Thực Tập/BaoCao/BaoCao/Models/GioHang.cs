namespace BaoCao.Models
{
    public class GioHang
    {
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public string Hinh { get; set; }
        public float DonGia { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien => SoLuong * DonGia;
    }
}
