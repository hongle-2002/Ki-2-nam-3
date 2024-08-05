using DemoWebApi.Common;
using DemoWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DemoWebApi.Common.Helper;

namespace DemoWebApi.Services
{
    public class CommonService
    {
        public async Task<SMSModel<T>> ListProcedureAsync<T>(string procName, List<SqlParameter> param) where T : class, new()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(Config.DbConnect))
                {
                    if (conn.State != ConnectionState.Open)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand(procName, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    foreach (var x in param)
                    {
                        cmd.Parameters.Add(x);
                    }

                    var res = await cmd.ExecuteReaderAsync();
                    var l_res = new List<T>();
                    if (res.HasRows)
                    {
                        l_res = await res.ConvertToListObjectAsync<T>();
                    }


                    if (conn.State != ConnectionState.Closed)
                    {
                        conn.Close();
                    }
                    conn.Dispose();
                    return new SMSModel<T>
                    {
                        StatusCode = 200,
                        Result = l_res
                    };

                }
            }
            catch (Exception ex)
            {
                return new SMSModel<T>
                {
                    StatusCode = 404
                };
            }
        }

    }
}
