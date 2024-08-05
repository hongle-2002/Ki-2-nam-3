using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace BTL_Wed_API.Controllers
{
    public class ThuocsController : ApiController
    {
        /*=====================================httpGet: dùng để lấy thông tin thuốc ==================================*/
                       
        //Lấy danh sách tất cả các thuốc
        [HttpGet]
        public List<tThuoc> GetThuocLists()
        {
            QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
            return dbThuoc.tThuocs.ToList();
        }
             
        //Lấy thông tin danh sách thuốc với mã nào đó
        [HttpGet]
        public List<tThuoc> GetThuocLists(string mathuoc)
        {
            if (mathuoc == null || mathuoc == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tThuocs.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tThuoc> tSachList = new List<tThuoc>();
            tSachList = data.tThuocs.Where(x => x.MaThuoc.Contains(mathuoc)).ToList();
            return tSachList;
        }

        //Lấy thông tin 1 thuốc với 1 mã 
        [HttpGet]
        public tThuoc GetThuoc(string id)
        {
            QuanLyThuocDBDataContext dbthuoc = new QuanLyThuocDBDataContext();
            return dbthuoc.tThuocs.FirstOrDefault(x => x.MaThuoc == id);
        }

        //Lấy thông tin của thuốc theo tên
        [HttpGet]
        public List<tThuoc> getAll(string tenthuoc)
        {
            if (tenthuoc == null || tenthuoc == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tThuocs.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            List<tThuoc> tSachList = new List<tThuoc>();
            tSachList = data.tThuocs.Where(x => x.TenThuoc.Contains(tenthuoc)).ToList();
            return tSachList;
        }

        //Tìm kiếm theo tên nhóm thuốc
        [HttpGet]
        public List<tThuoc> getnhom(string nhomthuoc)
        {
            if (nhomthuoc == null || nhomthuoc == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tThuocs.ToList();
            }

            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();

            var result = from thuoc in data.tThuocs
                         where data.tNhomThuocs.Where(nsx => nsx.TenNhom.Contains(nhomthuoc)).Select(y => y.MaNhom).Contains(thuoc.MaNhom)
                         select thuoc;

            List<tThuoc> tthuoclist = new List<tThuoc>();

            foreach (var thuoc in result)
            {
                tthuoclist.Add(thuoc);
            }
            return tthuoclist;
        }

        //Tìm kiếm theo tên nhà sản xuất
        [HttpGet]
        public List<tThuoc> getnsx(string nhasanxuat)
        {
            if (nhasanxuat == null || nhasanxuat == "")
            {
                QuanLyThuocDBDataContext thuocConnection = new QuanLyThuocDBDataContext();
                return thuocConnection.tThuocs.ToList();
            }
            QuanLyThuocDBDataContext data = new QuanLyThuocDBDataContext();
            
            var result = from thuoc in data.tThuocs
                         where data.tNhaSanXuats.Where(nsx => nsx.TenNSX.Contains(nhasanxuat)).Select(nsx => nsx.MaNSX).Contains(thuoc.MaNSX)
                         select thuoc;
            
            List<tThuoc> tthuoclist = new List<tThuoc>();
            
            foreach (var thuoc in result)
            {
                tthuoclist.Add(thuoc);
            }
            return tthuoclist;
        }

        /*====================================== httpPost, dịch vụ thêm mới một khách hàng===============================*/
        
        //Thêm thuốc thủ công
        [HttpPost]
        public bool InsertNewthuoc(string id, string tenthuoc, string nguonGoc, string thanhPhan, string maSX, string maNhom,string hansd, DateTime ngaysx,
            string soluong, string congdung, string cachdung, string chuy, string baoquan, string dangbaoche, string hamluong)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                tThuoc thuoc = new tThuoc();
                thuoc.MaThuoc = id;
                thuoc.TenThuoc = tenthuoc;
                thuoc.NguonGoc = nguonGoc;
                thuoc.ThanhPhan = thanhPhan;
                thuoc.HanSD = hansd;
                thuoc.SoLuong = soluong;
                thuoc.CongDung = congdung;
                thuoc.CachDung = cachdung;
                thuoc.ChuY = chuy;
                thuoc.NgaySX = ngaysx;
                thuoc.BaoQuan = baoquan;
                thuoc.DangBaoChe = dangbaoche;
                thuoc.HamLuong = hamluong;
                thuoc.MaNSX = maSX;
                thuoc.MaNhom = maNhom;

                dbThuoc.tThuocs.InsertOnSubmit(thuoc);
                dbThuoc.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        //Thêm 1 thuốc bằng đối tượng
        [HttpPost]
        public bool AddNewThuoc(tThuoc thuoc)
        {
            try
            {
                QuanLyThuocDBDataContext ThuocConnection = new QuanLyThuocDBDataContext();
                ThuocConnection.tThuocs.InsertOnSubmit(thuoc);
                ThuocConnection.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        /*========================================== httpPut để chỉnh sửa thông tin một khách hàng=========================*/

        //Sửa thuốc thủ công
        [HttpPut]
        public bool Updatethuoc(string id, string name, string nguonGoc, string thanhPhan, string maSX, string maNhom)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                //Lấy mã khách đã có
                tThuoc thuoc = dbThuoc.tThuocs.FirstOrDefault(x => x.MaThuoc == id);
                if (thuoc == null) return false;
                thuoc.MaThuoc = id;
                thuoc.TenThuoc = name;
                thuoc.NguonGoc = nguonGoc;
                thuoc.ThanhPhan = thanhPhan;
                thuoc.MaNSX = maSX;
                thuoc.MaNhom = maNhom;

                dbThuoc.tThuocs.InsertOnSubmit(thuoc);//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }

        //Sửa thuốc bằng đối tượng
        [HttpPut]
        public bool Updatethuoc(tThuoc data)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                //Lấy mã khách đã có
                tThuoc thuoc = dbThuoc.tThuocs.FirstOrDefault(x => x.MaThuoc == data.MaThuoc);
                if (thuoc == null) return false;
                thuoc.TenThuoc = data.TenThuoc;
                thuoc.NguonGoc = data.NguonGoc;
                thuoc.SoLuong = data.SoLuong;
                thuoc.ThanhPhan = data.ThanhPhan;
                thuoc.CongDung = data.CongDung;
                thuoc.CachDung = data.CachDung;
                thuoc.ChuY = data.ChuY;
                thuoc.NgaySX = data.NgaySX;
                thuoc.BaoQuan = data.BaoQuan;
                thuoc.DangBaoChe = data.DangBaoChe;
                thuoc.HamLuong = data.HamLuong;
                thuoc.HanSD = data.HanSD;
                thuoc.MaNhom = data.MaNhom;

                dbThuoc.SubmitChanges();//Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }
        
        /*=========================================== httpDelete để xóa một thuoc =========================================*/
        
        //Xóa thuốc
        [HttpDelete]
        public bool Deletethuoc(string id)
        {
            try
            {
                QuanLyThuocDBDataContext dbThuoc = new QuanLyThuocDBDataContext();
                //Lấy mã khách đã có
                tThuoc thuoc = dbThuoc.tThuocs.FirstOrDefault(x => x.MaThuoc == id);
                if (thuoc == null) return false;

                dbThuoc.tThuocs.DeleteOnSubmit(thuoc);
                dbThuoc.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
