using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace KTWeb.Models;

public partial class Cauthu
{
    public string CauThuId { get; set; } = null!;
    [Required]
    public string? HoVaTen { get; set; }

    public string? CauLacBoId { get; set; }

    public DateTime? Ngaysinh { get; set; }

    public string? ViTri { get; set; }

    public string? QuocTich { get; set; }

    [Required]
    [RegularExpression("^[0-9]+$", ErrorMessage = "Chỉ có thể nhập sô")]
    public string? SoAo { get; set; }
    [Required]
    [FileExtensions(Extensions = "png", ErrorMessage = "Chỉ có thể nhận file có định dạng png")]
    public string? Anh { get; set; }

    public virtual Caulacbo? CauLacBo { get; set; }

    public virtual ICollection<TrandauCauthu> TrandauCauthus { get; } = new List<TrandauCauthu>();

    public virtual ICollection<TrandauGhiban> TrandauGhibans { get; } = new List<TrandauGhiban>();
}
