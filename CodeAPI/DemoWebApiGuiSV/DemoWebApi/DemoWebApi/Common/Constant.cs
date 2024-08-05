using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoWebApi.Common
{
    public class Constant
    {
        public static string Current_Document()
        {
            string dirName = AppDomain.CurrentDomain.BaseDirectory; // Starting Dir
            FileInfo fileInfo = new FileInfo(dirName);
            DirectoryInfo parentDir = fileInfo.Directory.Parent.Parent;
            return parentDir.FullName;
        }
        public static class UserType
        {
            public static long Student = 5;
            public static long Teacher = 6;
        }
        public static class MasterData
        {
            public static long Department = 10;
            public static long Course = 11;
            public static long Nation = 24;
            public static long ClassSubjectType = 31;
        }
        public static class Action{
            public static long None = 0;
            public static long View = 1;
            public static long Add = 2;
            public static long Edit = 3;
            public static long Delete = 4;
        }
        public static class Reponse
        {
            public static string Success = "00";
        }
        public static class StatusCode
        {
            public static long Success = 200;
        }
        public static class ColorBoard
        {
            public static Color Title= Color.FromArgb(170, 123, 44);
            public static Color Fore = Color.FromArgb(34, 47, 62);
            public static Color BackGround = Color.FromArgb(223, 230, 233);
            public static Color Textbox = Color.FromArgb(236, 240, 241);

            public static class ForeColor
            {
                public static Color Active = Color.FromArgb(243, 210, 106);
                public static Color Normal = Color.White;
            }
            public static class BackgroundColor
            {
                public static Color Active = Color.FromArgb(120, 122, 109);
                public static Color Normal = Color.Transparent;
            }

        }
    }
}
