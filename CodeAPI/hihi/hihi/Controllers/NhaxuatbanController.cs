using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace hihi.Controllers
{
    public class NhaxuatbanController : ApiController
    {

        /*======================================httpget lấy phần tử =================================================*/

        //Get tat ca
        [HttpGet]
        public List<tNXB> getAll()
        {
            DataClasses1DataContext nhaSX = new DataClasses1DataContext();
            return nhaSX.tNXBs.ToList();
        }

        //Get theo 1 NSX ma nhat dinh
        [HttpGet]
        public tNXB GetNhaSX(string id)
        {
            DataClasses1DataContext dbNhaSX = new DataClasses1DataContext();
            return dbNhaSX.tNXBs.FirstOrDefault(x => x.MaNXB == id);
        }

        //Lấy danh sách thông tin NSX với mã nào đó
        [HttpGet]
        public List<tNXB> GetSachLists(string mansx)
        {
            if (mansx == null || mansx == "")
            {
                DataClasses1DataContext thuocConnection = new DataClasses1DataContext();
                return thuocConnection.tNXBs.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();
            List<tNXB> tNXBList = new List<tNXB>();
            tNXBList = data.tNXBs.Where(x => x.MaNXB.Contains(mansx)).ToList();
            return tNXBList;
        }

        //Lấy thông tin của NSX theo tên
        [HttpGet]
        public List<tNXB> getNSXName(string tennnxb)
        {
            if (tennnxb == null || tennnxb == "")
            {
                DataClasses1DataContext thuocConnection = new DataClasses1DataContext();
                return thuocConnection.tNXBs.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();
            List<tNXB> tList = new List<tNXB>();
            tList = data.tNXBs.Where(x => x.TenNXB.Contains(tennnxb)).ToList();
            return tList;
        }
/*
        //Lấy thông tin của NSX theo SDT
        [HttpGet]
        public List<T> getNSXSDT(string sdt)
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
*/
    }
}
