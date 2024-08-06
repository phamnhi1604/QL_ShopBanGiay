using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace ThietKeControls
{
    public class ControlSDT:TextBox 
    {
        ErrorProvider error;
        public ControlSDT()
        {
            this.KeyPress += ControlSDT_KeyPress;
            this.error = new ErrorProvider(); 
        }

        private void ControlSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // Ngăn chặn ký tự không hợp lệ
            }

            // Giới hạn số lượng ký tự tối đa
            if (this.Text.Length >= 10 && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // Ngăn chặn thêm ký tự nếu đã đạt đến giới hạn
            }
        }
    }
}
