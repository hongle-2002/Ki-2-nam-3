using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class TChiTietSanPham
{
    public string MaChiTietSp { get; set; } = null!;

    public string? MaThuoc { get; set; }

    public string? AnhDaiDien { get; set; }

    public decimal? DonGiaBan { get; set; }

    public string? GiamGia { get; set; }

    public int? Slton { get; set; }

    public virtual TDanhMucThuoc? MaThuocNavigation { get; set; }

    public virtual ICollection<TAnhChiTietSp> TAnhChiTietSps { get; } = new List<TAnhChiTietSp>();

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; } = new List<TChiTietHdb>();
}
