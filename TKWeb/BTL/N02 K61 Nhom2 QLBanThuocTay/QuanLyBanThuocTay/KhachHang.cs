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
    public partial class KhachHang : Form
    {
        public KhachHang()
        {
            InitializeComponent();
        }

        private void KhachHang_Load(object sender, EventArgs e)
        {
            LayDSKH();
        }

        private void LayDSKH()
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
                da.SelectCommand.CommandText = "LayDSKH";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //gán chuỗi kết nối
                da.SelectCommand.Connection = conn;
                //sử dụng phương thức fill để điền dữ liệu từ datatable vào SqlDataAdapter
                da.Fill(dt);
                //gán dữ liệu từ datatable vào datagridview
                dgvKhachHang.DataSource = dt;
                //đóng chuỗi kết nối
                conn.Close();
                //sử dụng thuộc tính Width và HeaderText để set chiều dài và tiêu đề cho các coloumns
                dgvKhachHang.Columns[0].Width = 100;
                dgvKhachHang.Columns[0].HeaderText = "Mã khách";
                dgvKhachHang.Columns[1].Width = 110;
                dgvKhachHang.Columns[1].HeaderText = "Tên khách";
                dgvKhachHang.Columns[2].Width = 110;
                dgvKhachHang.Columns[2].HeaderText = "Địa chỉ";
                dgvKhachHang.Columns[3].Width = 100;
                dgvKhachHang.Columns[3].HeaderText = "Điện thoại";
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

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (KiemTraThongTin())
            {
                try
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandText = "ThemKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MaKhach", SqlDbType.NVarChar).Value = txtMaKhach.Text;
                    cmd.Parameters.Add("@TenKhach", SqlDbType.NVarChar).Value = txtTenKhach.Text;
                    cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txtDiaChi.Text;
                    cmd.Parameters.Add("@DienThoai", SqlDbType.NVarChar).Value = txtDienThoai.Text;

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    LayDSKH();
                    Reset();
                    MessageBox.Show("Đã thêm mới khach hang thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtMaKhach.Text == "")
            {
                MessageBox.Show("Vui long nhap ma khach can xoa", "Thong bao", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhach.Focus();
            }
            else
            {
                try
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandText = "XoaKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MaKhach", SqlDbType.NVarChar).Value = Convert.ToString(txtMaKhach.Text);
                    cmd.Connection = conn;
                    conn.Open();
                    DialogResult dg = MessageBox.Show("Ban co chac chan muon xoa?", "Thong bao", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dg == DialogResult.Yes)
                    {
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        LayDSKH();
                        Reset();
                        MessageBox.Show("Da xoa khach hang thanh cong!", "Thong bao", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void dgvKhachHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            row = dgvKhachHang.Rows[e.RowIndex];
            txtMaKhach.Text = Convert.ToString(row.Cells["MaKhach"].Value);
            txtTenKhach.Text = Convert.ToString(row.Cells["TenKhach"].Value);
            txtDiaChi.Text = Convert.ToString(row.Cells["DiaChi"].Value);
            txtDienThoai.Text = Convert.ToString(row.Cells["DienThoai"].Value);
        }

        public bool KiemTraThongTin()
        {

            if (txtMaKhach.Text == "")
            {
                MessageBox.Show("Vui lòng nhập mã khach", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhach.Focus();
                return false;
            }
            if (txtTenKhach.Text == "")
            {
                MessageBox.Show("Vui lòng nhập tên khach", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenKhach.Focus();
                return false;
            }
            if (txtDiaChi.Text == "")
            {
                MessageBox.Show("Vui lòng nhap dia chi", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDiaChi.Focus();
                return false;
            }
            if (txtDienThoai.Text == "")
            {
                MessageBox.Show("Vui lòng nhập so dien thoai", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDienThoai.Focus();
                return false;
            }
            return true;
        }

        public void Reset()
        {
            txtMaKhach.Text = "";
            txtTenKhach.Text = "";
            txtDiaChi.Text = "";
            txtDienThoai.Text = "";
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMaKhach.Text == "")
            {
                MessageBox.Show("Vui lòng nhập mã khach hoc cần sửa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhach.Focus();
            }
            else if (KiemTraThongTin())
            {
                try
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandText = "SuaKhachHang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MaKhach", SqlDbType.NVarChar).Value = txtMaKhach.Text;
                    cmd.Parameters.Add("@TenKhach", SqlDbType.NVarChar).Value = txtTenKhach.Text;
                    cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txtDiaChi.Text;
                    cmd.Parameters.Add("@DienThoai", SqlDbType.NVarChar).Value = txtDienThoai.Text;

                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    LayDSKH();
                    Reset();
                    MessageBox.Show("Đã sửa khach hang  thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
    }
}
