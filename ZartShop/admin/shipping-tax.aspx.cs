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
public partial class admin_shipping_tax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Button1.Visible = true;
           
            fillgrid();

            if (Request.QueryString["id"] != null)
            {
                edit();
              
              

            }
        }
    }
    public void fillgrid()
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        DataTable ds = ad.getdefaultshippingtax();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
            Label1.Text = "No  shipping & tax value added till now";
            GridView1.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    public void edit()
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        DataTable ds = ad.getdefaultshippingtax();
        TextBox1.Text = ds.Rows[0]["shipping"].ToString();
        TextBox2.Text = ds.Rows[0]["tax"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        ad.addshippingtax(TextBox1.Text, TextBox2.Text);
        msg.Show("Default shipping tax successfully");
        TextBox1.Text = "";
        TextBox2.Text = "";
        fillgrid();
    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string d = Convert.ToString(GridView1.DataKeys[e.RowIndex].Value);

        admin ad = new admin();
        MessageBox msg = new MessageBox();



        ad.deleteshippingtax(d);

        msg.Show("Default shipping tax deleted successfully");

        Button1.Visible = true;
      
        fillgrid();


    }
}
