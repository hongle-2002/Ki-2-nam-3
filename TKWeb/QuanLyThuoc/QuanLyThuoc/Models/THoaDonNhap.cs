using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class THoaDonNhap
{
    public string MaHdn { get; set; } = null!;

    public string? MaNcc { get; set; }

    public string? MaDs { get; set; }

    public DateTime? NgayNhap { get; set; }

    public int? Slnhap { get; set; }

    public decimal? DonGiaNhap { get; set; }

    public string? GiamGia { get; set; }

    public decimal? TongTienHdn { get; set; }

    public string? PhuongThucThanhToan { get; set; }

    public virtual TDuocSi? MaDsNavigation { get; set; }

    public virtual TNhaCungCap? MaNccNavigation { get; set; }

    public virtual ICollection<TChiTietHdn> TChiTietHdns { get; } = new List<TChiTietHdn>();
}
