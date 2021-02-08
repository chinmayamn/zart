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
public partial class admin_new_arrivals : System.Web.UI.Page
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label1.Visible = false;
            fillcategory();
        }

    }
    public void fillcategory()
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        DataTable ds = category.fillcategory();
        if (ds.Rows.Count == 0)
        {

        }
        else
        {

            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = ds.Columns["category"].ToString();
            DropDownList1.DataValueField = ds.Columns["id"].ToString();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        if (DropDownList1.SelectedItem.Text == "Select")
        {
            msg.Show("Select category");
        }
        else
        {
            DataTable dt=category.getsubcategorybycategory(Convert.ToInt32(DropDownList1.SelectedItem.Value));
            if(dt.Rows.Count==0)
            {
            }
            else
            {
                  DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = dt.Columns["category"].ToString();
            DropDownList2.DataValueField = dt.Columns["id"].ToString();
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "Select");

            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        MessageBox msg = new MessageBox();
        if (DropDownList2.SelectedItem.Text == "Select")
        {
            msg.Show("Select sub-category");
        }
        else
        {
            DataTable dt = category.getsubsubcategorybysubcategory(Convert.ToInt32(DropDownList2.SelectedItem.Value));
            if (dt.Rows.Count == 0)
            {
            }
            else
            {
                DropDownList3.DataSource = dt;
                DropDownList3.DataTextField = dt.Columns["category"].ToString();
                DropDownList3.DataValueField = dt.Columns["id"].ToString();
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, "Select");
            }
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        if (DropDownList3.SelectedItem.Text == "Select")
        {
            msg.Show("Select sub-sub-category");
        }
        else
        {
            DataTable dt = ad.getproductsbycombination(Convert.ToInt32(DropDownList1.SelectedItem.Value), Convert.ToInt32(DropDownList2.SelectedItem.Value), Convert.ToInt32(DropDownList3.SelectedItem.Value));
            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label1.Visible = false;
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        int z = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            CheckBox c = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");


            if (c.Checked == true)
            {

                z++;
            }
        }


        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            CheckBox c = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            Label l = (Label)GridView1.Rows[i].FindControl("Label2");


            if (c.Checked == true)
            {
                ad.updateproductview("a", l.Text, "1");
            }
            else if (c.Checked == false)
            {
                ad.updateproductview("a", l.Text, "0");
            }

        }

        msg.Show("Products selected for new arrivals");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drv = (DataRowView)e.Row.DataItem;

       Label l = e.Row.FindControl("Label3") as Label;
        CheckBox c=e.Row.FindControl("CheckBox1") as CheckBox;

              if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            if (l.Text == "0")
            {
                c.Checked = false;

            }
            else if (l.Text == "1")
            {
                c.Checked = true;
            }

        }
    }
}
