using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class ChiTietSach
{
    public string MaChiTietSp { get; set; } = null!;

    public string? MaSach { get; set; }

    public string? DonGiaBan { get; set; }

    public string? GiamGia { get; set; }

    public int? SoLuongTon { get; set; }

    public string? AnhDaiDien { get; set; }

    public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; } = new List<ChiTietHoaDon>();

    public virtual Sach? MaSachNavigation { get; set; }
}
