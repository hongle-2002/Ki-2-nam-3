using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace test.Controllers
{
    public class SachmoiController : ApiController
    {
		[HttpGet]
		public List<tSach> GetCustomerLists()
		{
			DataClasses1DataContext dbCustomer = new
		   DataClasses1DataContext();
			return dbCustomer.tSaches.ToList();
		}
		//2. Dịch vụ lấy thông tin một khách hàng với mã nào  đó
		[HttpGet]
		public tSach GetCustomer(string id)
		{
			DataClasses1DataContext dbCustomer = new
		   DataClasses1DataContext();
			return dbCustomer.tSaches.FirstOrDefault(x =>
		   x.MaSach == id);
		}

		//3. httpPost, dịch vụ thêm mới một khách hàng
		[HttpPost]
		public bool InsertNewCustomer(string id, string name,
		string tacgia, int sotrang, int soluong, string matheloai, string manxb, string trongluong)
		{
			try
			{
				DataClasses1DataContext dbCustomer = new DataClasses1DataContext();
				tSach customer = new tSach();
				customer.MaSach = id;
				customer.TenSach = name;
				customer.TacGia = tacgia;
				customer.SoTrang = sotrang;
				customer.SoLuong = soluong;
				customer.MaTheLoai = matheloai;
				customer.MaNXB = manxb;
				customer.TrongLuong = trongluong;

				dbCustomer.tSaches.InsertOnSubmit(customer);
				dbCustomer.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
	}
}
