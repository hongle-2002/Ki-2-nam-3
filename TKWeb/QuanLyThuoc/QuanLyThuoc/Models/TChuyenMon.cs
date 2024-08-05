using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TChuyenMon
{
    public string MaChuyenMon { get; set; } = null!;

    public string? TenChuyenMon { get; set; }

    public virtual ICollection<TDuocSi> TDuocSis { get; } = new List<TDuocSi>();
}
