using DemoWebApi.Common;
using DemoWebApi.DataType;
using DemoWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace DemoWebApi.Services
{
    public class KhachService
    {
        private readonly CommonService _commonService;
        public KhachService() {
            this._commonService = new CommonService();
        }
        public async Task<SMSModel<KhachModel>> KhachGetById(string id)
        {
            string procName = "sp_khach_get_by_id";
            var par = new List<SqlParameter>();
            par.Add(new SqlParameter { ParameterName = "@Id", SqlDbType = System.Data.SqlDbType.NVarChar, Value = id });
            par.Add(new SqlParameter { ParameterName = "@ResCode", 
                SqlDbType = System.Data.SqlDbType.VarChar, Value = "", 
                Direction = ParameterDirection.InputOutput});
            par.Add(new SqlParameter
            {
                ParameterName = "@ResDes",
                SqlDbType = System.Data.SqlDbType.NVarChar,
                Value = "",
                Direction = ParameterDirection.InputOutput
            });
            var res = await _commonService.ListProcedureAsync<KhachModel>(procName, par);
            return res;
        }

        public async Task<SMSModel<KhachDataType>> Save(KhachDataType khachDataType)
        {
            string procName = "tbkhach_insert";
            var par = new List<SqlParameter>();
            par.Add(new SqlParameter { ParameterName = "@DataKhachType",
                SqlDbType = System.Data.SqlDbType.Structured,
                TypeName = "DataKhachType",
                Value = Helper.ConvertToObject(khachDataType)});
            par.Add(new SqlParameter
            {
                ParameterName = "@ResCode",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Value = "",
                Direction = ParameterDirection.InputOutput
            });
            par.Add(new SqlParameter
            {
                ParameterName = "@ResDes",
                SqlDbType = System.Data.SqlDbType.NVarChar,
                Value = "",
                Direction = ParameterDirection.InputOutput
            });
            var res = await _commonService.ListProcedureAsync<KhachDataType>(procName, par);
            return res;
        }

     
    }
}