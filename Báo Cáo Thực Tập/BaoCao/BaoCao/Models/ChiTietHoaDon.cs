using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class ChiTietHoaDon
{
    public string MaHdb { get; set; } = null!;

    public string MaChiTietSp { get; set; } = null!;

    public int? Slban { get; set; }

    public string? DonGiaBan { get; set; }

    public string? GiamGia { get; set; }

    public virtual ChiTietSach MaChiTietSpNavigation { get; set; } = null!;

    public virtual HoaDonBan MaHdbNavigation { get; set; } = null!;
}
