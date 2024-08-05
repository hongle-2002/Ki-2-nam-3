using System;
using System.Collections.Generic;

namespace QuanLyThuoc.Models;

public partial class TUser
{
    public string Username { get; set; } = null!;

    public string? Password { get; set; }

    public string? LoaiUser { get; set; }

    public virtual ICollection<TDuocSi> TDuocSis { get; } = new List<TDuocSi>();

    public virtual ICollection<TKhach> TKhaches { get; } = new List<TKhach>();
}
