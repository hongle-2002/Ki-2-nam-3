using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BaiTapLon.Controllers
{
    public class NhaxuatbanController : ApiController
    {
        private DBSachDataContext dataContext = new DBSachDataContext();

        [HttpGet]
        public List<tNXB> GetAllNXB()
        {
            return dataContext.tNXBs.ToList();
        }
        //Get theo 1 HSX theo ma nhat dinh
        [HttpGet]
        public tNXB GetNXB(string id)
        {
            DBSachDataContext dbNXB = new DBSachDataContext();
            return dbNXB.tNXBs.FirstOrDefault(x => x.MaNXB == id);
        }

        //Lấy danh sách thông tin HSX với mã nào đó
        [HttpGet]
        public List<tNXB> GetttLists(string manxb)
        {
            if (manxb == null || manxb == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tNXBs.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();
            List<tNXB> tTTList = new List<tNXB>();
            tTTList = data.tNXBs.Where(x => x.MaNXB.Contains(manxb)).ToList();
            return tTTList;
        }

        //Lấy thông tin của HSX theo tên
        [HttpGet]
        public List<tNXB> getName(string tennxb)
        {
            if (tennxb == null || tennxb == "")
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                return sachConnection.tNXBs.ToList();
            }

            DBSachDataContext data = new DBSachDataContext();
            List<tNXB> tList = new List<tNXB>();
            tList = data.tNXBs.Where(x => x.TenNXB.Contains(tennxb)).ToList();
            return tList;
        }
        /*=====================================httppsot thêm phần tử ===================================================*/

        //Them nha san xuat
        [HttpPost]
        public bool AddNewHSX(tNXB tl)
        {
            try
            {
                DBSachDataContext sachConnection = new DBSachDataContext();
                sachConnection.tNXBs.InsertOnSubmit(tl);
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
        public bool UpdateHSX(tNXB data)
        {
            try
            {
                DBSachDataContext dbnxb = new DBSachDataContext();
                //Lấy mã NSX đã có
                tNXB theloai = dbnxb.tNXBs.FirstOrDefault(x => x.MaNXB == data.MaNXB);
                if (theloai == null) return false;
                theloai.TenNXB = data.TenNXB;

                dbnxb.SubmitChanges();//Xác nhận chỉnh sửa
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
                tNXB hsx = dbHSX.tNXBs.FirstOrDefault(x => x.MaNXB == id);
                List<tSach> dienThoai = dbHSX.tSaches.Where(x => x.MaTheLoai == hsx.MaNXB).ToList();
                if (hsx == null || dienThoai == null) return false;

                dbHSX.tNXBs.DeleteOnSubmit(hsx);
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
