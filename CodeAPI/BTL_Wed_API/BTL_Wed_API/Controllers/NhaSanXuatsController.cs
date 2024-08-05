using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace BTL_Wed_API.Controllers
{
    public class NhaSanXuatsController : ApiController
    {
        /*======================================httpget lấy phần tử =================================================*/
        
        //Get tat ca
        [HttpGet]
        public List<tNhaSanXuat> getAll()
        {
            QuanLyThuocDBDataContext nhaSX = new QuanLyThuocDBDataContext();
            return nhaSX.tNhaSanXuats.ToList();
        }

        //Get theo 1 NSX ma nhat dinh
        [HttpGet]
        public tNhaSanXuat GetNhaSX(string id)
        {
            QuanLyThuocDBDataContext dbNhaSX = new QuanLyThuocDBDataContext();
            return dbNhaSX.tNhaSanXuats.FirstOrDefault(x => x.MaNSX == id);
        }

        //Lấy danh sách thông tin NSX với mã nào đó
        [HttpGet]
        public List<tNhaSanXuat> GetThuocLists(string mansx)
        {
            if (mansx == null || mansx == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tNhaSanXuats.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tNhaSanXuat> tNSXList = new List<tNhaSanXuat>();
            tNSXList = data.tNhaSanXuats.Where(x => x.MaNSX.Contains(mansx)).ToList();
            return tNSXList;
        }

        //Lấy thông tin của NSX theo tên
        [HttpGet]
        public List<tNhaSanXuat> getNSXName(string tennsx)
        {
            if (tennsx == null || tennsx == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tNhaSanXuats.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tNhaSanXuat> tList = new List<tNhaSanXuat>();
            tList = data.tNhaSanXuats.Where(x => x.TenNSX.Contains(tennsx)).ToList();
            return tList;
        }

        //Lấy thông tin của NSX theo SDT
        [HttpGet]
        public List<tNhaSanXuat> getNSXSDT(string sdt)
        {
            if (sdt == null || sdt == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tNhaSanXuats.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tNhaSanXuat> tList = new List<tNhaSanXuat>();
            tList = data.tNhaSanXuats.Where(x => x.SoDT.Contains(sdt)).ToList();
            return tList;
        }

        /*=====================================httppsot thêm phần tử ===================================================*/

        //Them nha san xuat
        [HttpPost]
        public bool AddNewNSX(tNhaSanXuat nsx)
        {
            try
            {
                QuanLyThuocDBDataContext ThuocConnection = new QuanLyThuocDBDataContext();
                ThuocConnection.tNhaSanXuats.InsertOnSubmit(nsx);
                ThuocConnection.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        /*======================================httpput cập nhật ===================================================*/
        
        [HttpPut]
        public bool UpdateNSX(tNhaSanXuat data)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                //Lấy mã NSX đã có
                tNhaSanXuat thuoc = dbThuoc.tNhaSanXuats.FirstOrDefault(x => x.MaNSX == data.MaNSX);
                if (thuoc == null) return false;
                thuoc.TenNSX = data.TenNSX;
                thuoc.DiaChi = data.DiaChi;
                thuoc.SoDT = data.SoDT;
                thuoc.Mail = data.Mail;

                dbThuoc.SubmitChanges();//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }


        /*===================================httpDelete để xóa ===========================================*/
        
        [HttpDelete]
        public bool DeleteNSX(string id)
        {
            try
            {
                QuanLyThuocDBDataContext dbNSX = new QuanLyThuocDBDataContext();
                //Lấy mã khách đã có
                tNhaSanXuat nsx = dbNSX.tNhaSanXuats.FirstOrDefault(x => x.MaNSX == id);
                List<tThuoc> thuoc = dbNSX.tThuocs.Where(x => x.MaNSX == nsx.MaNSX).ToList();
                if (nsx == null || thuoc == null) return false;

                dbNSX.tNhaSanXuats.DeleteOnSubmit(nsx);
                foreach(tThuoc dThuoc in thuoc)
                {
                    dbNSX.tThuocs.DeleteOnSubmit(dThuoc);
                }
                dbNSX.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
