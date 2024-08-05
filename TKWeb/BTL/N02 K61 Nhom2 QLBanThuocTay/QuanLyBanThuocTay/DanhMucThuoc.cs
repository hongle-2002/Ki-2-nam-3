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
    public partial class DanhMucThuoc : Form
    {
        public DanhMucThuoc()
        {
            InitializeComponent();
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void btnXoa_Load(object sender, EventArgs e)
        {
            LayDSThuoc();
        }

        private void LayDSThuoc()
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
                da.SelectCommand.CommandText = "LayDSThuoc";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //gán chuỗi kết nối
                da.SelectCommand.Connection = conn;
                //sử dụng phương thức fill để điền dữ liệu từ datatable vào SqlDataAdapter
                da.Fill(dt);
                //gán dữ liệu từ datatable vào datagridview
                dgvDanhMucThuoc.DataSource = dt;
                //đóng chuỗi kết nối
                conn.Close();
                //sử dụng thuộc tính Width và HeaderText để set chiều dài và tiêu đề cho các coloumns
                dgvDanhMucThuoc.Columns[0].Width = 50;
                dgvDanhMucThuoc.Columns[0].HeaderText = "Mã khách";
                dgvDanhMucThuoc.Columns[1].Width = 70;
                dgvDanhMucThuoc.Columns[1].HeaderText = "Tên khách";
                dgvDanhMucThuoc.Columns[2].Width = 50;
                dgvDanhMucThuoc.Columns[2].HeaderText = "Mã đơn vị";
                dgvDanhMucThuoc.Columns[3].Width = 50;
                dgvDanhMucThuoc.Columns[3].HeaderText = "Mã dạng đc";
                dgvDanhMucThuoc.Columns[4].Width = 70;
                dgvDanhMucThuoc.Columns[4].HeaderText = "Thành phần";
                dgvDanhMucThuoc.Columns[5].Width = 70;
                dgvDanhMucThuoc.Columns[5].HeaderText = "ĐgNhap";
                dgvDanhMucThuoc.Columns[6].Width = 70;
                dgvDanhMucThuoc.Columns[6].HeaderText = "Giá bán";
                dgvDanhMucThuoc.Columns[7].Width = 50;
                dgvDanhMucThuoc.Columns[7].HeaderText = "sl hiện có";
                dgvDanhMucThuoc.Columns[8].Width = 70;
                dgvDanhMucThuoc.Columns[8].HeaderText = "ngày sx";
                dgvDanhMucThuoc.Columns[9].Width = 50;
                dgvDanhMucThuoc.Columns[9].HeaderText = "mã nước sx";
                dgvDanhMucThuoc.Columns[10].Width = 70;
                dgvDanhMucThuoc.Columns[10].HeaderText = "hạn sd";
                dgvDanhMucThuoc.Columns[11].Width = 50;
                dgvDanhMucThuoc.Columns[11].HeaderText = "chống chỉ định";
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
