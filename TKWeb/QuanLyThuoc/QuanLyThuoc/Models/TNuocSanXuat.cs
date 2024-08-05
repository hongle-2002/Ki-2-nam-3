using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TNuocSanXuat
{
    public string MaNuocSx { get; set; } = null!;

    public string? TenNuocSx { get; set; }

    public virtual ICollection<TDanhMucThuoc> TDanhMucThuocs { get; } = new List<TDanhMucThuoc>();
}
