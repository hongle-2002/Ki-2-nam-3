using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanThuocTay
{
    public partial class NhanVien : Form
    {
        public NhanVien()
        {
            InitializeComponent();
        }

        private void NhanVien_Load(object sender, EventArgs e)
        {
            LayDSNhanVien();
        }

        public void LayDSNhanVien()
        {
            //khởi tạo các đối tượng SqlConnection, SqlDataAdapter, DataTable
            SqlConnection conn = new SqlConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            //lấy chuỗi kết nối từ file App.config
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            try
            {
                //mở chuỗi kết nối
                conn.Open();
                //khai báo đối tượng SqlCommand trong SqlDataAdapter
                da.SelectCommand = new SqlCommand();
                //gọi thủ tục từ SQL
                da.SelectCommand.CommandText = "LayDSNV";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //gán chuỗi kết nối
                da.SelectCommand.Connection = conn;
                //sử dụng phương thức fill để điền dữ liệu từ datatable vào SqlDataAdapter
                da.Fill(dt);
                //gán dữ liệu từ datatable vào datagridview
                dgvNhanVien.DataSource = dt;
                //đóng chuỗi kết nối
                conn.Close();
                //sử dụng thuộc tính Width và HeaderText để set chiều dài và tiêu đề cho các coloumns
                dgvNhanVien.Columns[0].Width = 100;
                dgvNhanVien.Columns[0].HeaderText = "Mã môn học";
                dgvNhanVien.Columns[1].Width = 110;
                dgvNhanVien.Columns[1].HeaderText = "Tên môn học";
                dgvNhanVien.Columns[2].Width = 110;
                dgvNhanVien.Columns[2].HeaderText = "Số tín chỉ";
                dgvNhanVien.Columns[3].Width = 100;
                dgvNhanVien.Columns[3].HeaderText = "Khoa quản lý";
                dgvNhanVien.Columns[4].Width = 100;
                dgvNhanVien.Columns[4].HeaderText = "Khoa quản lý";
                dgvNhanVien.Columns[5].Width = 100;
                dgvNhanVien.Columns[5].HeaderText = "Khoa quản lý";
                dgvNhanVien.Columns[6].Width = 100;
                dgvNhanVien.Columns[6].HeaderText = "Khoa quản lý";
                dgvNhanVien.Columns[7].Width = 100;
                dgvNhanVien.Columns[7].HeaderText = "Khoa quản lý";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Ban co muon thoat ko?", "Thong bao", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
            {
                this.Hide();
                Form1 form1 = new Form1();
                form1.ShowDialog();
            }
        }
    }
}
