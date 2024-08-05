using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class HoaDonBan
{
    public string MaHdb { get; set; } = null!;

    public DateTime? NgayBan { get; set; }

    public string? MaKh { get; set; }

    public string? MaNv { get; set; }

    public string? PhuongThucThanhToan { get; set; }

    public string? TongTien { get; set; }

    public string? GiamGia { get; set; }

    public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; } = new List<ChiTietHoaDon>();

    public virtual KhachHang? MaKhNavigation { get; set; }

    public virtual NhanVien? MaNvNavigation { get; set; }
}
