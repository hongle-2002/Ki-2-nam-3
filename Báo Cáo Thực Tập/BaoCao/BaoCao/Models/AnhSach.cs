using System;
using System.Collections.Generic;

namespace BaoCao.Models;

public partial class AnhSach
{
    public string MaSach { get; set; } = null!;

    public string TenFileAnh { get; set; } = null!;

    public string? Vitri { get; set; }

    public virtual Sach MaSachNavigation { get; set; } = null!;
}
