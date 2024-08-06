using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace ThietKeControls
{
    public class ControlEmail:TextBox 
    {
        ErrorProvider error;
        public ControlEmail()
        {
            this.KeyPress += MailTextBox_KeyPress;
            this.error = new ErrorProvider();
        }

        private void MailTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w{2,3}))+$)");
            String email = this.Text;
            Match match = regex.Match(email);

            if (match.Success)
            {
                error.Clear();
            }
            else error.SetError(this, "Email is not valid");
        }

    }
}
