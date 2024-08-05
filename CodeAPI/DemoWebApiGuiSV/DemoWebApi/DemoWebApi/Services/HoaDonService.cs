using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoWebApi.Services
{
    public class HoaDonService
    {
        private readonly CommonService _commonService;
        public HoaDonService(){
            this._commonService = new CommonService();
        }


    }
}