using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class TDanhMucThuoc
{
    public string MaThuoc { get; set; } = null!;

    public string? TenThuoc { get; set; }

    public string? CongDung { get; set; }

    public string? LieuDung { get; set; }

    public string? DoiTuongSd { get; set; }

    public string? TacDungPhu { get; set; }

    public string? BaoQuan { get; set; }

    public string? LuyY { get; set; }

    public string? ThanhPhan { get; set; }

    public string? MoTaThuoc { get; set; }

    public string? MaDvt { get; set; }

    public string? MaLoai { get; set; }

    public DateTime? NgaySanXuat { get; set; }

    public DateTime? HanSuDung { get; set; }

    public string? MaNuocSx { get; set; }

    public decimal? GiaLonNhat { get; set; }

    public decimal? GiaNhoNhat { get; set; }

    public string? AnhDaiDien { get; set; }

    public virtual TDonViTinh? MaDvtNavigation { get; set; }

    public virtual TLoaiThuoc? MaLoaiNavigation { get; set; }

    public virtual TNuocSanXuat? MaNuocSxNavigation { get; set; }

    public virtual ICollection<TAnhSanPham> TAnhSanPhams { get; } = new List<TAnhSanPham>();

    public virtual ICollection<TChiTietHdn> TChiTietHdns { get; } = new List<TChiTietHdn>();

    public virtual ICollection<TChiTietSanPham> TChiTietSanPhams { get; } = new List<TChiTietSanPham>();
}
