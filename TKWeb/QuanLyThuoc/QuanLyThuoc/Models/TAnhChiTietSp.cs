using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TAnhChiTietSp
{
    public string MaChiTietSp { get; set; } = null!;

    public string TenFileAnh { get; set; } = null!;

    public string? Vitri { get; set; }

    public virtual TChiTietSanPham MaChiTietSpNavigation { get; set; } = null!;
}
