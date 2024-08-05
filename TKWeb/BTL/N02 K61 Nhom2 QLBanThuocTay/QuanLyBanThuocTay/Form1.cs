using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanThuocTay
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you want to exit? ", "Notify", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                Close();
        }

        private Form currentFormChild;

        private void OpenChildForm(Form childForm)
        {
            if (currentFormChild != null)
            {
                currentFormChild.Close();
            }
            currentFormChild = childForm;
            childForm.TopLevel = false;
            childForm.Dock = DockStyle.Fill;
            panelBody.Controls.Add(childForm);
            panelBody.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new KhachHang());
        }

        private void btnDSNV_Click(object sender, EventArgs e)
        {
            OpenChildForm(new NhanVien());
        }

        private void btnDSNCC_Click(object sender, EventArgs e)
        {
            OpenChildForm(new NhaCungCap());
        }

        private void btnDSHDN_Click(object sender, EventArgs e)
        {
            OpenChildForm(new HoaDonNhap());
        }

        private void btnDSHDB_Click(object sender, EventArgs e)
        {
            OpenChildForm(new HoaDonBan());
        }

        private void btnCTHDN_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ChiTietHDN());
        }

        private void btnCTHDB_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ChiTietHDB());
        }

        private void btnDSCLT_Click(object sender, EventArgs e)
        {
            OpenChildForm(new DanhMucThuoc());
        }

        private void btnCTCT_Click(object sender, EventArgs e)
        {
            OpenChildForm(new CongDung());
        }

        private void btnDCCCT_Click(object sender, EventArgs e)
        {
            OpenChildForm(new DangDieuChe());
        }
    }
}
