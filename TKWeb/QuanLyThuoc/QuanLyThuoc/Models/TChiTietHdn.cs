using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TChiTietHdn
{
    public string MaHdn { get; set; } = null!;

    public string MaThuoc { get; set; } = null!;

    public decimal? DonGiaNhap { get; set; }

    public string? GiamGia { get; set; }

    public int? Slnhap { get; set; }

    public virtual THoaDonNhap MaHdnNavigation { get; set; } = null!;

    public virtual TDanhMucThuoc MaThuocNavigation { get; set; } = null!;
}
