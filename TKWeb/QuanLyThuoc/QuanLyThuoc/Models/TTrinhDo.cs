using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TTrinhDo
{
    public string MaTrinhDo { get; set; } = null!;

    public string? TenTrinhDo { get; set; }

    public virtual ICollection<TDuocSi> TDuocSis { get; } = new List<TDuocSi>();
}
