using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QL_ShopBanGiay_Application
{
    public partial class frm_QLKhachHang : Form
    {
        private QL_ShopBanGiay qlbg;
        private QL_ShopBanGiayTableAdapters.KhachHangTableAdapter KHTableAdapter;
        public frm_QLKhachHang()
        {
            InitializeComponent();
            AddColumnsToDataGridView();
            qlbg = new QL_ShopBanGiay();
            KHTableAdapter = new QL_ShopBanGiayTableAdapters.KhachHangTableAdapter();
        }

        // Tạo cột cho datagridview
        private void AddColumnsToDataGridView()
        {
            dgvKH.Columns.Clear(); // Xóa tất cả các cột hiện có

            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "IdKhachHang",
                HeaderText = "Mã Khách Hàng",
                DataPropertyName = "IdKhachHang",
                Width = 80
            });

            // Thêm cột IdNguoiDung
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "IdNguoiDung",
                HeaderText = "ID Người Dùng",
                DataPropertyName = "IdNguoiDung",
                Width = 80
            });

            // Thêm cột TenKhachHang
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "TenKhachHang",
                HeaderText = "Tên Khách Hàng",
                DataPropertyName = "TenKhachHang",
                Width = 150
            });

            // Thêm cột NgaySinh
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "NgaySinh",
                HeaderText = "Ngày Sinh",
                DataPropertyName = "NgaySinh",
                Width = 100
            });

            // Thêm cột GioiTinh
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "GioiTinh",
                HeaderText = "Giới Tính",
                DataPropertyName = "GioiTinh",
                Width = 80
            });

            // Thêm cột DiaChi
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "DiaChi",
                HeaderText = "Địa Chỉ",
                DataPropertyName = "DiaChi",
                Width = 200
            });

            // Thêm cột SoDienThoai
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "SoDienThoai",
                HeaderText = "Số Điện Thoại",
                DataPropertyName = "SoDienThoai",
                Width = 120
            });

            // Thêm cột Email
            dgvKH.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Email",
                HeaderText = "Email",
                DataPropertyName = "Email",
                Width = 150
            });
        }

        private void frm_QLKhachHang_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qL_ShopBanGiay.KhachHang' table. You can move, or remove it, as needed.
            this.khachHangTableAdapter.Fill(this.qL_ShopBanGiay.KhachHang);
            LoadKH();
        }

        // loadKH
        private void LoadKH()
        {
            qlbg.KhachHang.Clear();

            KHTableAdapter.Fill(qlbg.KhachHang);

            dgvKH.DataSource = qlbg.KhachHang;
        }

    }
}
