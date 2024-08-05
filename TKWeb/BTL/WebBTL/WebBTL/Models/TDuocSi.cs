using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class TDuocSi
{
    public string MaDs { get; set; } = null!;

    public string? TenDs { get; set; }

    public string? Username { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? GioiTinh { get; set; }

    public string? MaTrinhDo { get; set; }

    public string? MaChuyenMon { get; set; }

    public string? SoDienThoai { get; set; }

    public virtual TChuyenMon? MaChuyenMonNavigation { get; set; }

    public virtual TTrinhDo? MaTrinhDoNavigation { get; set; }

    public virtual ICollection<THoaDonBan> THoaDonBans { get; } = new List<THoaDonBan>();

    public virtual ICollection<THoaDonNhap> THoaDonNhaps { get; } = new List<THoaDonNhap>();

    public virtual TUser? UsernameNavigation { get; set; }
}
