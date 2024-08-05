using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class Sach
{
    public string MaSach { get; set; } = null!;

    public string? TenSach { get; set; }

    public string? TacGia { get; set; }

    public string? MaNxb { get; set; }

    public string? MaNxh { get; set; }

    public string? MaTheLoai { get; set; }

    public string? MoTa { get; set; }

    public string? NgonNgu { get; set; }

    public int? SoTrang { get; set; }

    public DateTime? NgayPhatHanh { get; set; }

    public string? KhoiLuong { get; set; }

    public string? DinhDang { get; set; }

    public double? GiaLonNhat { get; set; }

    public double? GiaNhoNhat { get; set; }

    public int SoLuong { get; set; }

    public string? Anh { get; set; }

    public virtual ICollection<AnhSach> AnhSaches { get; set; } = new List<AnhSach>();

    public virtual ICollection<ChiTietSach> ChiTietSaches { get; set; } = new List<ChiTietSach>();

    public virtual NhaXuatBan? MaNxbNavigation { get; set; }

    public virtual NhaPhatHanh? MaNxhNavigation { get; set; }

    public virtual TheLoai? MaTheLoaiNavigation { get; set; }
}
