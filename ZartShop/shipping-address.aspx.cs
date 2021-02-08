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
public partial class shipping_address : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MembershipUser mem = Membership.GetUser();
            if (mem == null)
            {
                string tempest = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("login.aspx?returnurl=" + tempest);
            }
            else
            {
              
                string userid = mem.ProviderUserKey.ToString();

                Order or = new Order();
                DataTable dt = or.getorderdet(userid);
                if (dt.Rows.Count == 0)
                {
                }
                else
                {
                    Label6.Text = dt.Rows[0]["id"].ToString();
                    TextBox1.Text = dt.Rows[0]["name"].ToString();
                    TextBox2.Text = dt.Rows[0]["address"].ToString();
                    TextBox3.Text = dt.Rows[0]["landmark"].ToString();
                    TextBox4.Text = dt.Rows[0]["city"].ToString();
                    string st = dt.Rows[0]["state"].ToString();

                    for (int i = 0; i < DropDownList1.Items.Count; i++)
                    {
                        if (DropDownList1.Items[i].Text.ToString() == st)
                        {
                            DropDownList1.Items[i].Selected = true;
                        }
                    }
                    TextBox5.Text = dt.Rows[0]["postal"].ToString();
                    TextBox6.Text = dt.Rows[0]["mobile"].ToString();
                    TextBox7.Text = dt.Rows[0]["email"].ToString();
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Order obj1 = new Order();
        MembershipUser mem = Membership.GetUser();
        if (mem == null)
        {
            string tempest = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect("login.aspx?returnurl=" + tempest);
        }
        else
        {
            string id = mem.UserName;
            MembershipUser u = Membership.GetUser(id);
            string c = u.UserName.ToString();
            ProfileCommon pc = Profile.GetProfile(c);


            string userid = mem.ProviderUserKey.ToString();

            if (Request.QueryString["id"] == null || Request.QueryString["id"] == "2")
            {

                 DataTable dt = obj1.getorderdet(userid);
                 if (dt.Rows.Count == 0)
                 {
                     DataTable i = obj1.Insertorder(userid, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.SelectedItem.Text.ToString(), TextBox5.Text, TextBox6.Text, "India", TextBox7.Text);
                     if (Convert.ToInt32(i.Rows[0]["id"]) != 0)
                     {
                         Session["orderid"] = i.Rows[0]["id"].ToString();
                         Response.Redirect("order-summary.aspx");
                     }
                     else
                     {

                         Response.Redirect("Login.aspx");
                     }
                 }
                 else
                 {
                     if (Convert.ToInt32(dt.Rows[0]["isdelete"]) == 0)
                     {
                         DataTable i3 = obj1.Insertorder(userid, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.SelectedItem.Text.ToString(), TextBox5.Text, TextBox6.Text, "India", TextBox7.Text);

                         if (Convert.ToInt32(i3.Rows[0]["id"]) != 0)
                         {
                             Session["orderid"] = i3.Rows[0]["id"].ToString();
                             Response.Redirect("order-summary.aspx");
                         }

                     }
                     else
                     {
                         DataTable i2 = obj1.Updateorder(Label6.Text, userid, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.SelectedItem.Text.ToString(), TextBox5.Text, TextBox6.Text, "India", TextBox7.Text);

                         if (Convert.ToInt32(i2.Rows[0]["id"]) != 0)
                         {
                             Session["orderid"] = i2.Rows[0]["id"].ToString();
                             Response.Redirect("order-summary.aspx");
                         }

                     }
                 }


              
            }
            else
            if (Request.QueryString["id"].ToString() == "1")
            {
                pc.name = TextBox1.Text;
                pc.Address = TextBox2.Text;
                pc.Landmark = TextBox3.Text;
                pc.City = TextBox4.Text;
                pc.State = DropDownList1.SelectedItem.Text.ToString();
                pc.PostalCode = TextBox5.Text;
                pc.Mobile = TextBox6.Text;
                pc.Country = "India";
                pc.ShippingEmail = TextBox7.Text;
                pc.Save();
                DataTable i = obj1.Insertorder(userid, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.SelectedItem.Text.ToString(), TextBox5.Text, TextBox6.Text, "India", TextBox7.Text);
                if (Convert.ToInt32(i.Rows[0]["id"]) != 0)
                {
                    Session["orderid"] = i.Rows[0]["id"].ToString();
                    Response.Redirect("order-summary.aspx");
                }

               
            }
          
              
          
        }
    }
}
