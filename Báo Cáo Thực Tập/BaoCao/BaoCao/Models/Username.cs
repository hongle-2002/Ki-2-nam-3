using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class Username
{
    public string Username1 { get; set; } = null!;

    public string? Password { get; set; }

    public int? LoaiUser { get; set; }

    public virtual ICollection<KhachHang> KhachHangs { get; set; } = new List<KhachHang>();

    public virtual ICollection<NhanVien> NhanViens { get; set; } = new List<NhanVien>();
}
