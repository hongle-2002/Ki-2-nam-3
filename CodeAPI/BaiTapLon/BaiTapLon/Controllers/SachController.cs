using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BaiTapLon.Controllers
{
    public class SachController : ApiController
    {
        private DBSachDataContext dataContext = new DBSachDataContext();

        [HttpGet]
        public List<tSach> GetAllSach()
        {
            return dataContext.tSaches.ToList();
        }

        [HttpGet]
        public tSach getById(string id)
        {
            return dataContext.tSaches.FirstOrDefault(t => t.MaSach == id);
        }

        [HttpGet]
        public List<tSach> getAll(string tensach)
        {
            if (tensach == null || tensach == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tSaches.ToList();
            }

            DBSachDataContext data = new    DBSachDataContext();
            List<tSach> tSachList = new List<tSach>();
            tSachList = data.tSaches.Where(x => x.TenSach.Contains(tensach)).ToList();
            return tSachList;
        }

        //Lấy thông tin danh sách sach với mã nào đó
        [HttpGet]
        public List<tSach> GetSachLists(string masach)
        {
            if (masach == null || masach == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tSaches.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();
            List<tSach> tSachList = new List<tSach>();
            tSachList = data.tSaches.Where(x => x.MaSach.Contains(masach)).ToList();
            return tSachList;
        }
        //Tìm kiếm theo tên the loai
        [HttpGet]
        public List<tSach> getnhom(string tentheloai)
        {
            if (tentheloai == null || tentheloai == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tSaches.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();

            var result = from sach in data.tSaches
                         where data.tTheLoais.Where(nsx => nsx.TenTheLoai.Contains(tentheloai)).Select(y => y.MaTheLoai).Contains(sach.MaTheLoai)
                         select sach;

            List<tSach> tsachlist = new List<tSach>();

            foreach (var sach in result)
            {
                tsachlist.Add(sach);
            }
            return tsachlist;
        }

        //Tìm kiếm theo tên nhà xuat ban
        [HttpGet]
        public List<tSach> getnxb(string nhaxuatban)
        {
            if (nhaxuatban == null || nhaxuatban == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tSaches.ToList();
            }
            DBSachDataContext data = new DBSachDataContext();

            var result = from sach in data.tSaches
                         where data.tNXBs.Where(nsx => nsx.TenNXB.Contains(nhaxuatban)).Select(nsx => nsx.MaNXB).Contains(sach.MaNXB)
                         select sach;

            List<tSach> tsachlist = new List<tSach>();

            foreach (var sach in result)
            {
                tsachlist.Add(sach);
            }
            return tsachlist;
        }
        /*====================================== httpPost, dịch vụ thêm mới một sach===============================*/

        //Thêm thuốc thủ công
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
        public string create([FromBody] tSach sach)
        {
            try
            {

                dataContext.tSaches.InsertOnSubmit(sach);
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
        /*========================================== httpPut để chỉnh sửa thông tin một sach=========================*/

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


        /*=========================================== httpDelete để xóa một sach =========================================*/




        [HttpDelete]

        public bool Deletesach(string id)
        {
            try
            {
                DBSachDataContext dbSach = new DBSachDataContext();
                //Lấy mã khách đã có
                tSach sach = dbSach.tSaches.FirstOrDefault(x => x.MaSach == id);
                if (sach == null) return false;

                dbSach.tSaches.DeleteOnSubmit(sach);
                dbSach.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
