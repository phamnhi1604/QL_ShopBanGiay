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
    public partial class frmQL_NhanVien : Form
    {
        public frmQL_NhanVien()
        {
            InitializeComponent();
        }

        private void nhanVienBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.nhanVienBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.qL_ShopBanGiay);

        }

        private void frmQL_NhanVien_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qL_ShopBanGiay.NhanVien' table. You can move, or remove it, as needed.
            this.nhanVienTableAdapter.Fill(this.qL_ShopBanGiay.NhanVien);

        }
    }
}
