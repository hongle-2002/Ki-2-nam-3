using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BTL_Wed_API.Controllers
{
    public class NhomThuocsController : ApiController
    {
        /*======================================httpget lấy phần tử =================================================*/

        //Get tat ca
        [HttpGet]
        public List<tNhomThuoc> getAll()
        {
            QuanLyThuocDBDataContext nhomThuoc = new QuanLyThuocDBDataContext();
            return nhomThuoc.tNhomThuocs.ToList();
        }

        //Get theo 1 NSX ma nhat dinh
        [HttpGet]
        public tNhomThuoc GetLoaiNhom(string id)
        {
            QuanLyThuocDBDataContext dbNhaSX = new QuanLyThuocDBDataContext();
            return dbNhaSX.tNhomThuocs.FirstOrDefault(x => x.MaNhom == id);
        }

        //Lấy danh sách thông tin nhóm với mã nào đó
        [HttpGet]
        public List<tNhomThuoc> GetThuocLists(string manhoms)
        {
            if (manhoms == null || manhoms == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tNhomThuocs.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tNhomThuoc> tnhomlist = new List<tNhomThuoc>();
            tnhomlist = data.tNhomThuocs.Where(x => x.MaNhom.Contains(manhoms)).ToList();
            return tnhomlist;
        }

        //Lấy thông tin của nhóm theo tên
        [HttpGet]
        public List<tNhomThuoc> getNSXName(string tennhoms)
        {
            if (tennhoms == null || tennhoms == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tNhomThuocs.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tNhomThuoc> tList = new List<tNhomThuoc>();
            tList = data.tNhomThuocs.Where(x => x.TenNhom.Contains(tennhoms)).ToList();
            return tList;
        }

        /*=====================================httppsot thêm phần tử ===================================================*/

        //Them nha san xuat
        [HttpPost]
        public bool AddNewNSX(tNhomThuoc nhom)
        {
            try
            {
                QuanLyThuocDBDataContext ThuocConnection = new QuanLyThuocDBDataContext();
                ThuocConnection.tNhomThuocs.InsertOnSubmit(nhom);
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
        public bool UpdateNhom(tNhomThuoc data)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                //Lấy mã thuốc đã có
                tNhomThuoc thuoc = dbThuoc.tNhomThuocs.FirstOrDefault(x => x.MaNhom == data.MaNhom);
                if (thuoc == null) return false;
                thuoc.TenNhom = data.TenNhom;

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
        public bool DeleteNhom(string id)
        {
            try
            {
                QuanLyThuocDBDataContext dbnhom = new QuanLyThuocDBDataContext();
                //Lấy mã khách đã có
                tNhomThuoc loainhom = dbnhom.tNhomThuocs.FirstOrDefault(x => x.MaNhom == id);
                List<tThuoc> thuoc = dbnhom.tThuocs.Where(x => x.MaNhom == loainhom.MaNhom).ToList();
                if (loainhom == null || thuoc == null) return false;

                dbnhom.tNhomThuocs.DeleteOnSubmit(loainhom);
                foreach (tThuoc dThuoc in thuoc)
                {
                    dbnhom.tThuocs.DeleteOnSubmit(dThuoc);
                }
                dbnhom.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
