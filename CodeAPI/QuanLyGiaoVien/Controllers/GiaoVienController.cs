using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml.Linq;

namespace QuanLyGiaoVien.Controllers
{
    public class GiaoVienController : ApiController
    {
        [HttpGet]
        public List<tSach> getAll(string name)
        {
            if (name == null || name == "")
            {
                DataClasses1DataContext GiaoVienConnection = new DataClasses1DataContext();
                return GiaoVienConnection.tSaches.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();
            List<tSach> tGiaoVienList = new List<tSach>();
            tGiaoVienList = data.tSaches.Where(x => x.TenSach.Contains(name)).ToList();
            return tGiaoVienList;

        }
        [HttpGet]
        public tSach getGiaoVienDetail(string id)
        {
			DataClasses1DataContext GiaovienConnection = new DataClasses1DataContext();
            return GiaovienConnection.tSaches.FirstOrDefault(b => b.MaSach == id);
        }

        [HttpGet]
        //public List<tGiaoVien> getGiaoVienDetail1(int luong)
        //{
        //    DBGiaoViensDataContext GiaoVienConnection = new DBGiaoViensDataContext();
        //    //return GiaoVienConnection.tGiaoViens.Where(a => a.Luong == luong).ToList();

        //    List<tGiaoVien> tGiaoVienList = new List<tGiaoVien>();
        //    tGiaoVienList = GiaoVienConnection.tGiaoViens.Where(x => x.Luong == luong).ToList();
        //    return tGiaoVienList;
        //}

        [HttpPost]
        public bool AddNewGiaoVien(tSach giaoVien)
        {
            try
            {
				DataClasses1DataContext GiaoVienConnection = new DataClasses1DataContext();
                GiaoVienConnection.tSaches.InsertOnSubmit(giaoVien);
                GiaoVienConnection.SubmitChanges();


                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpPut]
        public bool UpdateNewGiaoVien(tSach postData)
        {
            try
            {
				DataClasses1DataContext GiaoVienConnection = new DataClasses1DataContext();
                tSach GiaoVien = GiaoVienConnection.tSaches.FirstOrDefault(b => b.MaSach == postData.MaSach);
                if (GiaoVien == null) return false;
                // gan gia tri tu post data vao GiaoVien tim thay trong db
                GiaoVien.MaSach = postData.TenSach;
                GiaoVien.TenSach = postData.TenSach;
                GiaoVien.TacGia = postData.TacGia;
				GiaoVien.SoTrang = postData.SoTrang;
				GiaoVien.SoLuong = postData.SoLuong;
				GiaoVien.MaTheLoai = postData.tTheLoai.TenTheLoai;
                GiaoVien.MaNXB = postData.tNXB.TenNXB;
				GiaoVien.TrongLuong = postData.TrongLuong;
				GiaoVienConnection.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpDelete]
        public bool deleteGiaoVien(string id)
        {
			DataClasses1DataContext GiaoVienConnection = new DataClasses1DataContext();
            tSach book = GiaoVienConnection.tSaches.FirstOrDefault(b => b.MaSach == id);
            // ko tim thay doi tuong giao vien nao trong db
            if (book == null) { return false; }
            // tim thay va xoa giao vien khoi db
            GiaoVienConnection.tSaches.DeleteOnSubmit(book);
            // submit changed
            GiaoVienConnection.SubmitChanges();
            return true;
        }
    }
}
