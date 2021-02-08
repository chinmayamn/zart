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
public partial class admin_category : System.Web.UI.Page
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
    
        Label1.Visible = false;
        Button2.Visible = false;
        Button1.Visible = true;
       
     
       
        if (!Page.IsPostBack)
        {
            Button1.Visible = true;
            Button2.Visible = false;
         
          
            Label1.Visible = false;
         
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
        DataTable ds = category.fillcategory();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
            Label1.Text = "No category added till now";
            GridView1.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //DropDownList1.DataSource = ds;
            //DropDownList1.DataTextField = ds.Columns["category"].ToString();
            //DropDownList1.DataValueField = ds.Columns["id"].ToString();
            //DropDownList1.DataBind();
            //DropDownList1.Items.Insert(0, "Select");
            //DropDownList3.DataSource = ds;
            //DropDownList3.DataTextField = ds.Columns["category"].ToString();
            //DropDownList3.DataValueField = ds.Columns["id"].ToString();
            //DropDownList3.DataBind();
            //DropDownList3.Items.Insert(0, "Select");
        }
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        category.createcategory(TextBox1.Text);
        msg.Show("Category created successfully");
        TextBox1.Text = "";
        fillgrid();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(Request.QueryString["id"]);

        category.updatecategory(id, TextBox1.Text);
        Response.Write("<script type=text/javascript>window.alert('category updated successfully');window.location='category.aspx';</script>");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fillgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int d = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        
        MessageBox msg = new MessageBox();

        DataTable ds = category.checksubcategory(d);
        if (ds.Rows.Count == 0)
        {

            category.deletecategory(d);

            msg.Show("Category deleted successfully");
            TextBox1.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            fillgrid();
        }
        else
        {
            msg.Show("Delete subcategories first");
        }
    }
    public void edit()
    {
        
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        DataTable ds = category.getcategorybyid(id);
        TextBox1.Text = ds.Rows[0]["category"].ToString();

    }


  




   
}
