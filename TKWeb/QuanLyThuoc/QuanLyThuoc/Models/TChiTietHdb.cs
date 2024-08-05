using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TChiTietHdb
{
    public string MaHdb { get; set; } = null!;

    public string MaChiTietSp { get; set; } = null!;

    public int? Slban { get; set; }

    public decimal? DonGiaBan { get; set; }

    public string? GiamGia { get; set; }

    public virtual TChiTietSanPham MaChiTietSpNavigation { get; set; } = null!;

    public virtual THoaDonBan MaHdbNavigation { get; set; } = null!;
}
