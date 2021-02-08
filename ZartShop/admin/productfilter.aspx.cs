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
using ZartDAL;
public partial class admin_productfilter : System.Web.UI.Page
{
    Filter filter = new Filter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = true;
            Button4.Visible = false;
            fillgrid();
            fillgrid1();
            if (Request.QueryString["cid"] != null)
            {
                edit();
                Button1.Visible = false;
                Button2.Visible = true;
            

            }
            if (Request.QueryString["sid"] != null)
            {
                edits();
                Button3.Visible = false;
                Button4.Visible = true;


            }
           
        }
    }
    public void fillgrid()
    {
        
        MessageBox msg = new MessageBox();
        DataTable ds = filter.fillFiltermaster();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
            
            GridView1.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = ds;
            GridView1.DataBind();
            ddlFilter.DataSource = ds;
            ddlFilter.DataTextField = ds.Columns["filtername"].ToString();
            ddlFilter.DataValueField = ds.Columns["id"].ToString();
            ddlFilter.DataBind();
        }
    }
    public void fillgrid1()
    {

        MessageBox msg = new MessageBox();
        DataTable ds = filter.fillFilter();
        if (ds.Rows.Count == 0)
        {
            Label2.Visible = true;

            GridView2.Visible = false;
        }
        else
        {
            Label2.Visible = false;
            GridView2.Visible = true;
            GridView2.DataSource = ds;
            GridView2.DataBind();
           
        }
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        filter.addfiltermaster(TextBox1.Text);
        TextBox1.Text = "";
        fillgrid();
        msg.Show("Color added successfully");

    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        
        MessageBox msg = new MessageBox();
        filter.deletefiltermaster(id);
        fillgrid();
        msg.Show("Filter deleted successfully");
    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        
        filter.updatefiltermaster(TextBox1.Text, Convert.ToInt32(Request.QueryString["cid"]));
        Response.Write("<script type=text/javascript>window.alert('Color filter updated successfully');window.location='productfilter.aspx';</script>");

    }
    
    public void edit()
    {
        
        DataTable dt = filter.getfiltermasterbyid(Convert.ToInt32(Request.QueryString["cid"]));
        TextBox1.Text = dt.Rows[0]["color"].ToString();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox(); 
        filter.addfilter(TextBox2.Text,Convert.ToInt32(ddlFilter.SelectedItem.Value));
        TextBox2.Text = "";
        fillgrid1();
        msg.Show("Color added successfully");
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value);

        MessageBox msg = new MessageBox();
        filter.deletefilter(id);
        fillgrid1();
        msg.Show("Filter deleted successfully");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        filter.updatefilter(Convert.ToInt32(ddlFilter.SelectedItem.Value), TextBox2.Text, Convert.ToInt32(Request.QueryString["sid"]));
        Response.Write("<script type=text/javascript>window.alert('Color filter updated successfully');window.location='productfilter.aspx';</script>");

    }
    public void edits()
    {

        DataTable dt = filter.getfilterbyid(Convert.ToInt32(Request.QueryString["sid"]));
        TextBox2.Text = dt.Rows[0]["filtervalue"].ToString();
        for (int i = 0; i < ddlFilter.Items.Count; i++)
        {
            if (ddlFilter.Items[i].Value.ToString() == dt.Rows[0]["filterid"].ToString())
            {
                ddlFilter.Items[i].Selected = true;
            }
        }
    }
}
