using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoWebApi.Models
{
    public class HoaDonKhachModel
    {
        public string TenBan { set; get; }
        public string TenKhach { set; get; }
        public string DiaChi { get; set; }
        public long DienThoai { get; set; }
        public float TongTien { get; set; }
    }
}