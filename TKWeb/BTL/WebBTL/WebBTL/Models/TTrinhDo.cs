using System;
using System.Collections.Generic;

namespace WebBTL.Models;

public partial class TTrinhDo
{
    public string MaTrinhDo { get; set; } = null!;

    public string? TenTrinhDo { get; set; }

    public virtual ICollection<TDuocSi> TDuocSis { get; } = new List<TDuocSi>();
}
