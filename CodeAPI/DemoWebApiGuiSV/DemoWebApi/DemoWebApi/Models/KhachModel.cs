using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoWebApi.Models
{
    public class KhachModel
    {
        public string MaKhach { get; set;}
        public string TenKhach { get; set; }
        public string DiaChi { get; set; }
        public long DienThoai { get; set; }
    }
}