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
public partial class admin_payment_gateway : System.Web.UI.Page
{
    PaymentGateway pgway = new PaymentGateway();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            fillgrid();
        }
    }

    public void fillgrid()
    {
        
        DataTable dt = pgway.getpaymentgateway();
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            if ( Convert.ToInt32(dt.Rows[0][0]) == 1)
            {
                CheckBoxList1.Items[0].Selected = true;
            }
            if (Convert.ToInt32(dt.Rows[0][1]) == 1)
            {
                CheckBoxList1.Items[1].Selected = true;
            }
            if (Convert.ToInt32(dt.Rows[0][2]) == 1)
            {
                CheckBoxList1.Items[2].Selected = true;
            }
            if (Convert.ToInt32(dt.Rows[0][3]) == 1)
            {
                CheckBoxList1.Items[3].Selected = true;
            }
            if (Convert.ToInt32(dt.Rows[0][4]) == 1)
            {
                CheckBoxList1.Items[4].Selected = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int f = 0;

            if(CheckBoxList1.Items[0].Selected==true)
            {
                a = 1;
            }
            if (CheckBoxList1.Items[1].Selected == true)
            {
                b = 1;
            }
            if (CheckBoxList1.Items[2].Selected == true)
            {
                c = 1;
            }
            if (CheckBoxList1.Items[3].Selected == true)
            {
               d = 1;
            }
            if (CheckBoxList1.Items[4].Selected == true)
            {
                f = 1;
            }
        pgway.addpaymentgateway(a,b,c,d,f);
        msg.Show("Payment gateway selected successfully");
        fillgrid();
      

    }
}
