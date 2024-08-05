using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class TNhaCungCap
{
    public string MaNcc { get; set; } = null!;

    public string? TenNcc { get; set; }

    public string? DiaChi { get; set; }

    public string? SoDienThoai { get; set; }

    public virtual ICollection<THoaDonNhap> THoaDonNhaps { get; } = new List<THoaDonNhap>();
}
