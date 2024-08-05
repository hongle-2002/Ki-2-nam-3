﻿using System;
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
    public partial class ChiTietHDN : Form
    {
        public ChiTietHDN()
        {
            InitializeComponent();
        }

        private void ChiTietHDN_Load(object sender, EventArgs e)
        {
            LayDSCTHDN();
        }

        private void LayDSCTHDN()
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
                da.SelectCommand.CommandText = "LayDSCTHDN";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //gán chuỗi kết nối
                da.SelectCommand.Connection = conn;
                //sử dụng phương thức fill để điền dữ liệu từ datatable vào SqlDataAdapter
                da.Fill(dt);
                //gán dữ liệu từ datatable vào datagridview
                dgvChiTietHDN.DataSource = dt;
                //đóng chuỗi kết nối
                conn.Close();
                //sử dụng thuộc tính Width và HeaderText để set chiều dài và tiêu đề cho các coloumns
                dgvChiTietHDN.Columns[0].Width = 50;
                dgvChiTietHDN.Columns[0].HeaderText = "Mã HDN";
                dgvChiTietHDN.Columns[1].Width = 110;
                dgvChiTietHDN.Columns[1].HeaderText = "Ma thuoc";
                dgvChiTietHDN.Columns[2].Width = 50;
                dgvChiTietHDN.Columns[2].HeaderText = "So luong nhap";
                dgvChiTietHDN.Columns[3].Width = 50;
                dgvChiTietHDN.Columns[3].HeaderText = "Don gia";
                dgvChiTietHDN.Columns[4].Width = 100;
                dgvChiTietHDN.Columns[4].HeaderText = "Khuyen mai";
                dgvChiTietHDN.Columns[5].Width = 100;
                dgvChiTietHDN.Columns[5].HeaderText = "Thanh tien";
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
