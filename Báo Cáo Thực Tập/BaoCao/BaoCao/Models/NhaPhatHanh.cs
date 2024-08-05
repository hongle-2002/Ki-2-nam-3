using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class NhaPhatHanh
{
    public string MaNph { get; set; } = null!;

    public string? TenNph { get; set; }

    public string? ThongTinNph { get; set; }

    public virtual ICollection<Sach> Saches { get; set; } = new List<Sach>();
}
