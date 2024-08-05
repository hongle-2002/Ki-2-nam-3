using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class THoaDonBan
{
    public string MaHdb { get; set; } = null!;

    public DateTime? NgayBan { get; set; }

    public string? MaKh { get; set; }

    public string? MaDs { get; set; }

    public string? GiamGia { get; set; }

    public decimal? TongTienHd { get; set; }

    public string? PhuongThucThanhToan { get; set; }

    public virtual TDuocSi? MaDsNavigation { get; set; }

    public virtual TKhach? MaKhNavigation { get; set; }

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; } = new List<TChiTietHdb>();
}
