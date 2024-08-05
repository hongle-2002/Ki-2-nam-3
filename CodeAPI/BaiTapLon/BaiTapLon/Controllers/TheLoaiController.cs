using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BaiTapLon.Controllers
{
    public class TheLoaiController : ApiController
    {
        private DBSachDataContext dataContext = new DBSachDataContext();

        [HttpGet]
        public List<tTheLoai> GetAllSach()
        {
            return dataContext.tTheLoais.ToList();
        }

        //Get theo 1 HSX theo ma nhat dinh
        [HttpGet]
        public tTheLoai GetTheLoai(string id)
        {
            DBSachDataContext dbTheLoai = new DBSachDataContext();
            return dbTheLoai.tTheLoais.FirstOrDefault(x => x.MaTheLoai == id);
        }

        //Lấy danh sách thông tin HSX với mã nào đó
        [HttpGet]
        public List<tTheLoai> GetttLists(string matheloai)
        {
            if (matheloai == null || matheloai == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tTheLoais.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();
            List<tTheLoai> tTTList = new List<tTheLoai>();
            tTTList = data.tTheLoais.Where(x => x.MaTheLoai.Contains(matheloai)).ToList();
            return tTTList;
        }

        //Lấy thông tin của HSX theo tên
        [HttpGet]
        public List<tTheLoai> getName(string tentheloai)
        {
            if (tentheloai == null || tentheloai == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tTheLoais.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();
            List<tTheLoai> tList = new List<tTheLoai>();
            tList = data.tTheLoais.Where(x => x.TenTheLoai.Contains(tentheloai)).ToList();
            return tList;
        }
        /*=====================================httppsot thêm phần tử ===================================================*/

        //Them nha san xuat
        [HttpPost]
        public bool AddNewHSX(tTheLoai tl)
        {
            try
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                sachConnection.tTheLoais.InsertOnSubmit(tl);
                sachConnection.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        /*======================================httpput cập nhật ===================================================*/

        [HttpPut]
        public bool UpdateHSX(tTheLoai data)
        {
            try
            {
                DBSachDataContext dbTheLoai = new DBSachDataContext();
                //Lấy mã NSX đã có
                tTheLoai theloai = dbTheLoai.tTheLoais.FirstOrDefault(x => x.MaTheLoai == data.MaTheLoai);
                if (theloai == null) return false;
                theloai.TenTheLoai = data.TenTheLoai;

                dbTheLoai.SubmitChanges();//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }


        /*===================================httpDelete để xóa ===========================================*/

        [HttpDelete]
        public bool DeleteHSX(string id)
        {
            try
            {
                DBSachDataContext dbHSX = new DBSachDataContext();
                //Lấy mã khách đã có
                tTheLoai hsx = dbHSX.tTheLoais.FirstOrDefault(x => x.MaTheLoai == id);
                List<tSach> dienThoai = dbHSX.tSaches.Where(x => x.MaTheLoai == hsx.MaTheLoai).ToList();
                if (hsx == null || dienThoai == null) return false;

                dbHSX.tTheLoais.DeleteOnSubmit(hsx);
                foreach (tSach dDienThoai in dienThoai)
                {
                    dbHSX.tSaches.DeleteOnSubmit(dDienThoai);
                }
                dbHSX.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
