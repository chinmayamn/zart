using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using ZartDAL;
public partial class forgot_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        DataTable dt = ad.getuserpassword(TextBox1.Text);
        if (dt.Rows.Count == 0)
        {
            TextBox1.Text = ""; msg.Show("User does not exists");
        }
        else
        {
            string password = dt.Rows[0]["password"].ToString();
            string email = TextBox1.Text;
            mailing mail = new mailing();
            mail.mymail(email,"Dear Customer,<br/> Your Zartshop.com account password is :" + password +"<br/><br/>Regards,<br>ZartShop.com","Account Password");
            TextBox1.Text = "";
            msg.Show("Password has been sent to your email address");
        }
    }
}
