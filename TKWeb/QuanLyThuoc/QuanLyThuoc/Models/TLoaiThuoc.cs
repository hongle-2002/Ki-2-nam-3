using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TLoaiThuoc
{
    public string MaLoai { get; set; } = null!;

    public string? TenLoai { get; set; }

    public virtual ICollection<TDanhMucThuoc> TDanhMucThuocs { get; } = new List<TDanhMucThuoc>();
}
