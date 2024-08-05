using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoWebApi.Models
{
    public partial class SMSModel<T>
    {
        public List<T> Result { get; set; }
        public long StatusCode { get; set; }
        public int TotalRecord { get; set; }
        public string RespondCode { get; set; }
        public string RespondDes { get; set; }
    }
}
