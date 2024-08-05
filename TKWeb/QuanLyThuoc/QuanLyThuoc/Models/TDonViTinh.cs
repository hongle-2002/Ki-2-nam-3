using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TDonViTinh
{
    public string MaDvt { get; set; } = null!;

    public string? TenDvt { get; set; }

    public virtual ICollection<TDanhMucThuoc> TDanhMucThuocs { get; } = new List<TDanhMucThuoc>();
}
