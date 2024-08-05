using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace hihi.Controllers
{
    public class TheLoaiController : ApiController
    {
        /*======================================httpget lấy phần tử =================================================*/

        //Get tat ca
        [HttpGet]
        public List<tTheLoai> getAll()
        {
            DataClasses1DataContext theloai = new DataClasses1DataContext();
            return theloai.tTheLoais.ToList();
        }

        //Get theo 1 NXB ma nhat dinh
        [HttpGet]
        public tTheLoai GetTheLoai(string id)
        {
            DataClasses1DataContext dbNhaXB = new DataClasses1DataContext();
            return dbNhaXB.tTheLoais.FirstOrDefault(x => x.MaTheLoai == id);
        }

        //Lấy danh sách thông tin nhóm với mã nào đó
        [HttpGet]
        public List<tTheLoai> GetTheLoaiLists(string matheloais)
        {
            if (matheloais == null || matheloais == "")
            {
                DataClasses1DataContext SachConnection = new DataClasses1DataContext();
                return SachConnection.tTheLoais.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();
            List<tTheLoai> tnhomlist = new List<tTheLoai>();
            tnhomlist = data.tTheLoais.Where(x => x.MaTheLoai.Contains(matheloais)).ToList();
            return tnhomlist;
        }

        //Lấy thông tin của nhóm theo tên
        [HttpGet]
        public List<tTheLoai> getNSXName(string tennhoms)
        {
            if (tennhoms == null || tennhoms == "")
            {
                DataClasses1DataContext thuocConnection = new DataClasses1DataContext();
                return thuocConnection.tTheLoais.ToList();
            }

            DataClasses1DataContext data = new DataClasses1DataContext();
            List<tTheLoai> tList = new List<tTheLoai>();
            tList = data.tTheLoais.Where(x => x.TenTheLoai.Contains(tennhoms)).ToList();
            return tList;
        }




    }
}
