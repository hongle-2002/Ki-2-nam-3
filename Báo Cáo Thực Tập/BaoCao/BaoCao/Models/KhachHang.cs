using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class KhachHang
{
    public string MaKh { get; set; } = null!;

    public string? TenKh { get; set; }

    public string? Username { get; set; }

    public string? DiaChi { get; set; }

    public string? Sdt { get; set; }

    public virtual ICollection<HoaDonBan> HoaDonBans { get; set; } = new List<HoaDonBan>();

    public virtual Username? UsernameNavigation { get; set; }
}
