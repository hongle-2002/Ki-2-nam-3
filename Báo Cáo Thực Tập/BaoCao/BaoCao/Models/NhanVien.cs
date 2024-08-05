using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class NhanVien
{
    public string MaNv { get; set; } = null!;

    public string? Username { get; set; }

    public string? TenNv { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? Sdt { get; set; }

    public string? DiaChi { get; set; }

    public string? ChucVu { get; set; }

    public virtual ICollection<HoaDonBan> HoaDonBans { get; set; } = new List<HoaDonBan>();

    public virtual Username? UsernameNavigation { get; set; }
}
