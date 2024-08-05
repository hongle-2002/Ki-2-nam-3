using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication2.Controllers
{
    public class CustomersController : ApiController
    {
        [HttpGet]
        public List<SanPham> GetCustomerLists()
        {
            DBCustomersDataContext dbCustomer = new
           DBCustomersDataContext();
            return dbCustomer.SanPhams.ToList();
        }

        [HttpPost]
        public bool InsertNewCustomer(string id, string name, string mota, int gianhap, int giaban)
        {
            try
            {
                DBCustomersDataContext dbCustomer = new
               DBCustomersDataContext();
                SanPham customer = new SanPham();
                customer.MaSP = id;
                customer.TenSP = name;
                customer.MoTa = mota;
                customer.GiaNhap = gianhap;
                customer.GiaBan = giaban;

                dbCustomer.SanPhams.InsertOnSubmit(customer);
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
