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
public partial class admin_freeshipping : System.Web.UI.Page
{
    Freeshipping fshipping = new Freeshipping();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Button1.Visible = true;
            Button2.Visible = false;
            fillgrid();

            if (Request.QueryString["id"] != null)
            {
                edit();
                Button1.Visible = false;
                Button2.Visible = true;

            }
        }
    }
    public void fillgrid()
    {
        
        MessageBox msg = new MessageBox();
        DataTable ds = fshipping.freeshipping();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
            Label1.Text = "No free shipping value added till now";
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
        
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        DataTable ds = fshipping.getfreeshippingbyid(id);
        TextBox1.Text = ds.Rows[0]["price"].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        fshipping.addfreeshipping(TextBox1.Text);
        msg.Show("Free shipping successfully");
        TextBox1.Text = "";
        fillgrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(Request.QueryString["id"]);

        fshipping.updatefreeshipping(id, TextBox1.Text);
        Response.Write("<script type=text/javascript>window.alert('Price updated successfully');window.location='freeshipping.aspx';</script>");

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int d = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        
        MessageBox msg = new MessageBox();



        fshipping.deletefreeshipping(d);

            msg.Show("Price deleted successfully");
            TextBox1.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            fillgrid();
        
      
    }
}
