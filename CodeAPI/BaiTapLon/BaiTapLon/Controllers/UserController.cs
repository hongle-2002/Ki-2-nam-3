using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BaiTapLon.Controllers
{
    public class UserController : ApiController
    {

		
		//httpGet: dùng để lấy thông tin khách hàng
		//1. Dịch vụ lấy thông tin của toàn bộ tài khoản
		[HttpGet]
		public List<tUser> GetUserLists()
		{
			DBSachDataContext dbUser = new DBSachDataContext();
			return dbUser.tUsers.ToList();
		}

		[HttpGet]
		public tUser GetTkMkUser(string tk, string mk)
		{
			DBSachDataContext dbUser = new DBSachDataContext();
			return dbUser.tUsers.FirstOrDefault(x => x.TaiKhoan == tk && x.MatKhau == mk);
		}

		[HttpPost]
		public bool checkTK(string taikhoan)
		{
			DBSachDataContext db = new DBSachDataContext();
			var check = db.tUsers.FirstOrDefault(x => x.TaiKhoan == taikhoan);
			if (check == null)
			{
				return true;
			}
			return false;
		}
		[HttpPost]
		public bool Login(string tk, string mk)
		{
			try
			{
				DBSachDataContext db = new DBSachDataContext();
				tUser user = db.tUsers.FirstOrDefault(x => (x.TaiKhoan == tk) && (x.MatKhau == mk));
				if (user != null)
				{
					return true;
				}
				return false;
			}
			catch
			{
				return false;
			}
		}

		//3. httpPost, dịch vụ thêm mới một khách hàng
		[HttpPost]
		public bool InsertNewUser(string taikhoan, string matkhau)
		{
			try
			{

				DBSachDataContext dbUser = new DBSachDataContext();
				tUser user = new tUser();
				if (user.TaiKhoan == taikhoan)
				{
					return false;
				}
				user.TaiKhoan = taikhoan;
				user.MatKhau = matkhau;

				dbUser.tUsers.InsertOnSubmit(user);
				dbUser.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		//Them nha san xuat
		[HttpPost]
		public bool InsertUser(tUser tl)
		{
			try
			{
				DBSachDataContext sachConnection = new DBSachDataContext();
				sachConnection.tUsers.InsertOnSubmit(tl);
				sachConnection.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		//4. httpPut để chỉnh sửa thông tin một khách hàng
		[HttpPut]
		public bool UpdateUser(string taikhoan, string matkhau)
		{
			try
			{
				DBSachDataContext dbUser = new DBSachDataContext();
				//Lấy mã khách đã có
				tUser user = dbUser.tUsers.FirstOrDefault(x => x.TaiKhoan == taikhoan);
				if (user == null) return false;
				user.TaiKhoan = taikhoan;
				user.MatKhau = matkhau;
				dbUser.SubmitChanges();//Xác nhận chỉnh sửa
				return true;
			}
			catch
			{
				return false;
			}
		}
		//5.httpDelete để xóa một Khách hàng
		[HttpDelete]
		public bool DeleteUser(string taikhoan)
		{
			try
			{
				DBSachDataContext dbUser = new DBSachDataContext();
				//Lấy mã khách đã có
				tUser user = dbUser.tUsers.FirstOrDefault(x => x.TaiKhoan == taikhoan);
				if (user == null) return false;

				dbUser.tUsers.DeleteOnSubmit(user);
				dbUser.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}


		
	}
}
