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
public partial class my_account : System.Web.UI.Page
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
            filldata();
        }

    }
    public void filldata()
    {
        LinkButton1.Visible = true;
        LinkButton2.Visible = false;
        TextBox1.Visible = false;
        TextBox2.Visible = false;
        TextBox3.Visible = false;
        TextBox4.Visible = false;
        TextBox5.Visible = false;
        TextBox6.Visible = false;
        TextBox7.Visible = false;
        TextBox8.Visible = false;
        DropDownList1.Visible = false;
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        Label7.Visible = true;
        Label9.Visible = true;
        admin ad = new admin();
        MembershipUser mem = Membership.GetUser();
        if (mem == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string id = mem.UserName;
            MembershipUser u = Membership.GetUser(id);
            string c = u.UserName.ToString();
            ProfileCommon comm = Profile.GetProfile(c);
            Label1.Text = comm.name;
            Label2.Text = comm.Address;
            Label3.Text = comm.Landmark;
            Label4.Text = comm.City;
            Label5.Text = comm.State;
            Label6.Text = comm.PostalCode;
            Label7.Text = comm.Country;
            Label9.Text = comm.ShippingEmail;

            Label8.Text = comm.Mobile;

            Label10.Text = mem.Email.ToString();

            DataTable dt = ad.getuserpassword(c);
            if (dt.Rows.Count == 0)
            {
            }
            else
            {
                Label11.Text = dt.Rows[0]["password"].ToString();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MembershipUser mem = Membership.GetUser();
        string id = mem.UserName;
        MembershipUser u = Membership.GetUser(id);
        string c = u.UserName.ToString();
        ProfileCommon comm = Profile.GetProfile(c);

        TextBox1.Visible = true;
        TextBox2.Visible = true;
        TextBox3.Visible = true;
        TextBox4.Visible = true;
        TextBox5.Visible = true;
        TextBox6.Visible = true;
        TextBox7.Visible = true;
        TextBox8.Visible = true;
        DropDownList1.Visible = true;
        LinkButton2.Visible = true;

        TextBox1.Text = comm.name;
        TextBox2.Text = comm.Address;
        TextBox3.Text = comm.Landmark;


        TextBox4.Text = comm.City;
        string st = comm.State;

        //for (int i = 0; i < DropDownList1.Items.Count; i++)
        //{
        //    if (DropDownList1.Items[i].Text.ToString() == st)
        //    {
        //        DropDownList1.Items[i].Selected = true;
        //    }
        //}

        TextBox5.Text = comm.PostalCode;
        TextBox6.Text = comm.Mobile;
        TextBox8.Text = comm.ShippingEmail;
        DataTable dt = ad.getuserpassword(c);
       
            TextBox7.Text = dt.Rows[0]["password"].ToString();
      
        TextBox7.Visible = true;
             
       
        LinkButton1.Visible = false;
        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
         Label11.Visible = false;
        Label8.Visible = false;
        Label9.Visible = false;

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        TextBox1.Visible = false;
        TextBox2.Visible = false;
        TextBox3.Visible = false;
        TextBox4.Visible = false;
        TextBox5.Visible = false;
        TextBox6.Visible = false;
        TextBox7.Visible = false;
        TextBox8.Visible = false;
        DropDownList1.Visible = false;
        LinkButton1.Visible = true;
        LinkButton2.Visible = false;
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        Label11.Visible = true;
        Label8.Visible = true;
        Label9.Visible = true;
        MembershipUser mem = Membership.GetUser();
        string id = mem.UserName;
        MembershipUser u = Membership.GetUser(id);
        string c = u.UserName.ToString();
        ProfileCommon comm = Profile.GetProfile(c);

        comm.name = TextBox1.Text;
        comm.Address = TextBox2.Text;
        comm.Landmark = TextBox3.Text;
        comm.City = TextBox4.Text;
        comm.State = DropDownList1.SelectedItem.Text.ToString();
        comm.PostalCode = TextBox5.Text;
        comm.Mobile = TextBox6.Text;
        comm.Country = "India";
        comm.ShippingEmail = TextBox8.Text;
        admin ad = new admin();
        ad.updateuserpassword(c, TextBox7.Text);

        comm.Save();

        ((user)this.Page.Master).data();

        mailing mail = new mailing();
        mail.mymail(Label10.Text,"Dear " + TextBox1.Text +"Your account details has been updated successfully."+ "<br/><br/> Regards ,<br/>ZartShop.com" ,"Account Details");
        filldata();
    }
}
