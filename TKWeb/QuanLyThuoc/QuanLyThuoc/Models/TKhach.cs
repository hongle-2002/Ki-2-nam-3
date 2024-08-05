using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TKhach
{
    public string MaKh { get; set; } = null!;

    public string? TenKh { get; set; }

    public string? Username { get; set; }

    public string? DiaChi { get; set; }

    public string? SoDienThoai { get; set; }

    public virtual ICollection<THoaDonBan> THoaDonBans { get; } = new List<THoaDonBan>();

    public virtual TUser? UsernameNavigation { get; set; }
}
