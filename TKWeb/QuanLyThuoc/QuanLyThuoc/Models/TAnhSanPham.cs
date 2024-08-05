using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TAnhSanPham
{
    public string MaThuoc { get; set; } = null!;

    public string TenFileAnh { get; set; } = null!;

    public string? Vitri { get; set; }

    public virtual TDanhMucThuoc MaThuocNavigation { get; set; } = null!;
}
