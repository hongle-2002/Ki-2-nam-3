using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BTLApi.Controllers
{
    public class TruyenController : ApiController
    {
        private DataClassesDataContext dataContext = new DataClassesDataContext();
        
        [HttpGet]
        public List<TRUYEN> getAll()
        {
            try
            {
                return dataContext.TRUYENs.ToList();
            }
            catch(Exception ex)
            {
                return null;
            }
           
        }

        [HttpGet]
        public TRUYEN getById(int id)
        {
            return dataContext.TRUYENs.FirstOrDefault(t => t.IDTruyen == id);
        }

        [HttpPost]
        public string create([FromBody] TRUYEN truyen)
        {
            try
            {
                truyen.LuotXem = 0;
                truyen.NgayCapNhat = DateTime.Now;
                truyen.NgayTao = DateTime.Now;
                dataContext.TRUYENs.InsertOnSubmit(truyen);
                dataContext.SubmitChanges();
                return "Thành công";
            }
            catch
            {
                return "Lỗi";
            }
        }

        [HttpPut]
        public string update(int id, [FromBody] TRUYEN truyenInput)
        {
            TRUYEN truyen = dataContext.TRUYENs.FirstOrDefault(t => t.IDTruyen == id);
            if (truyen is null)
            {
                return "Sai id truyện";
            }
            try
            {
                truyen.IDTheLoai = truyenInput.IDTheLoai;
                truyen.TenTruyen = truyenInput.TenTruyen;
                truyen.UrlAvatar = truyenInput.UrlAvatar;
                truyen.MoTa = truyenInput.MoTa;
                truyen.NgayCapNhat = DateTime.Now;
                dataContext.SubmitChanges();
                return "Thành công";
            }
            catch
            {
                return "Lỗi";
            }
        }

        [HttpDelete]
        public string delete(int id)
        {
            TRUYEN truyen = dataContext.TRUYENs.FirstOrDefault(t => t.IDTruyen == id);
            if (truyen is null)
            {
                return "Sai id truyện";
            }
            try
            {
                dataContext.TRUYENs.DeleteOnSubmit(truyen);
                dataContext.SubmitChanges();
                return "Thành công";
            }
            catch
            {
                return "Lỗi";
            }
        }
    }
}
