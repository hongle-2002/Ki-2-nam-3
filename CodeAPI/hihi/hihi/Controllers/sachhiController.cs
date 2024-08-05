using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace hihi.Controllers
{
    public class sachhiController : ApiController
    {
        private DataClasses1DataContext dataContext = new DataClasses1DataContext();

        [HttpGet]
        public List<tSach> getAll()
        {
            return dataContext.tSaches.ToList();
        }

        [HttpGet]
        public tSach getById(string id)
        {
            return dataContext.tSaches.FirstOrDefault(t => t.MaSach == id);
        }

        [HttpPost]
        public bool InsertNewBook(String id, string tensach, string tacgia, int sotrang, int soluong,
        string matheloai, string manxb, string trongluong)
        {
            try
            {
                tSach sach = new tSach();
                sach.MaSach = id;
                sach.TenSach = tensach;
                sach.TacGia = tacgia;
                sach.SoTrang = sotrang;
                sach.SoLuong = soluong;
                sach.MaTheLoai = matheloai;
                sach.MaNXB = manxb;
                sach.TrongLuong = trongluong;


                dataContext.tSaches.InsertOnSubmit(sach);
                dataContext.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPost]
        public string create([FromBody] tSach truyen)
        {
            try
            {
               
                dataContext.tSaches.InsertOnSubmit(truyen);
                dataContext.SubmitChanges();
                return "Thành công";
            }
            catch
            {
                return "Lỗi";
            }
        }
        // sua
        /* [HttpPut]
         public string update(string id, [FromBody] tSach truyenInput)
         {
             tSach truyen = dataContext.tSaches.FirstOrDefault(t => t.MaSach == id);
             if (truyen is null)
             {
                 return "Sai id truyện";
             }
             try
             {
                 truyen.MaSach = truyenInput.MaSach;
                 truyen.TenSach = truyenInput.TenSach;
                 truyen.TacGia = truyenInput.TacGia;
                 truyen.SoTrang = truyenInput.SoTrang;
                 truyen.SoLuong = truyenInput.SoLuong;
                 truyen.MaNXB = truyenInput.MaNXB;
                 truyen.MaTheLoai = truyenInput.MaTheLoai;
                 truyen.TrongLuong = truyenInput.TrongLuong;
                 dataContext.SubmitChanges();
                 return "Thành công";
             }
             catch
             {
                 return "Lỗi";
             }
         }*/

        //Sửa thuốc thủ công
        [HttpPut]
        public bool UpdateSach(string id, string tensach, string tacgia, int sotrang, int soluong,
        string matheloai, string manxb, string trongluong)
        {
            try
            {
                 
                //Lấy mã khách đã có
                tSach sach = dataContext.tSaches.FirstOrDefault(x => x.MaSach == id);
                if (sach == null) return false;
                sach.MaSach = id;
                sach.TenSach = tensach;
                sach.TacGia = tacgia;
                sach.SoTrang = sotrang;
                sach.SoLuong = soluong;
                sach.MaTheLoai = matheloai;
                sach.MaNXB = manxb;
                sach.TrongLuong = trongluong;

              
                dataContext.tSaches.InsertOnSubmit(sach);//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }
        //Sửa thuốc bằng đối tượng
        [HttpPut]
        public bool Updatesach(tSach data)
        {
            try
            {
                //Lấy mã khách đã có
                tSach sach = dataContext.tSaches.FirstOrDefault(x => x.MaSach == data.MaSach);
                if (sach == null) return false;
      
                sach.TenSach = data.TenSach;
                sach.TacGia = data.TacGia;
                sach.SoTrang = data.SoTrang;
                sach.SoLuong = data.SoLuong;
                sach.MaTheLoai = data.MaTheLoai;
                sach.MaNXB = data.MaNXB;
                sach.TrongLuong = data.TrongLuong;

                dataContext.SubmitChanges();//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }

      




        [HttpDelete]

        public bool Deletethuoc(string id)
        {
            try
            {
                DataClasses1DataContext dbThuoc = new DataClasses1DataContext();
                //Lấy mã khách đã có
                tSach thuoc = dbThuoc.tSaches.FirstOrDefault(x => x.MaSach == id);
                if (thuoc == null) return false;

                dbThuoc.tSaches.DeleteOnSubmit(thuoc);
                dbThuoc.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }



        // tim kiem
        //Tìm kiếm theo tên the loai
        [HttpGet]
        public List<tSach> getnhom(string nhomthuoc)
        {
            if (nhomthuoc == null || nhomthuoc == "")
            {
                DataClasses1DataContext thuocConnection = new DataClasses1DataContext();
                return thuocConnection.tSaches.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();

            var result = from thuoc in data.tSaches
                         where data.tTheLoais.Where(nsx => nsx.TenTheLoai.Contains(nhomthuoc)).Select(y => y.MaTheLoai).Contains(thuoc.MaTheLoai)
                         select thuoc;

            List<tSach> tthuoclist = new List<tSach>();

            foreach (var thuoc in result)
            {
                tthuoclist.Add(thuoc);
            }
            return tthuoclist;
        }

        //Tìm kiếm theo tên nha xuat ban
        [HttpGet]
        public List<tSach> getnsx(string nhasanxuat)
        {
            if (nhasanxuat == null || nhasanxuat == "")
            {
                DataClasses1DataContext thuocConnection = new DataClasses1DataContext();
                return thuocConnection.tSaches.ToList();
            }
            DataClasses1DataContext data = new DataClasses1DataContext();

            var result = from thuoc in data.tSaches
                         where data.tNXBs.Where(nsx => nsx.TenNXB.Contains(nhasanxuat)).Select(nsx => nsx.MaNXB).Contains(thuoc.MaNXB)
                         select thuoc;

            List<tSach> tthuoclist = new List<tSach>();

            foreach (var thuoc in result)
            {
                tthuoclist.Add(thuoc);
            }
            return tthuoclist;
        }

    }
}

