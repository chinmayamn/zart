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
public partial class admin_cms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { Button2.Visible = false;
        if (!Page.IsPostBack)
        {
         //   fillgrid();
        }


    }
    public void fillgrid(string type)
    {
       Cms ad = new Cms();

       
        DataTable dt = ad.getaboutus(type);
        if (dt.Rows.Count == 0)
        {
            Button1.Visible = true;
            Button2.Visible = false;
            uc1.Value = "";
        }
        else
        {
            Button2.Visible = true;
            Button1.Visible = false;
            uc1.Value = Server.HtmlDecode(dt.Rows[0]["description"].ToString());
            string types = dt.Rows[0]["type"].ToString();
            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == types)
                {
                    DropDownList1.Items[i].Selected = true;
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();Cms ad = new Cms();
        ad.insertaboutus(DropDownList1.SelectedItem.Text.ToString(), Server.HtmlEncode(uc1.Value));
        msg.Show("CMS added successfully");
        fillgrid(DropDownList1.SelectedItem.Text.ToString());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();Cms ad = new Cms();

        ad.insertaboutus(DropDownList1.SelectedItem.Text.ToString(),Server.HtmlEncode(uc1.Value));
        msg.Show("CMS updated successfully");
        fillgrid(DropDownList1.SelectedItem.Text.ToString());
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();
        if (DropDownList1.SelectedItem.Text == "Select")
        {
            msg.Show("Select page");
            uc1.Value = "";

        }
        else
        {
            fillgrid(DropDownList1.SelectedItem.Text.ToString());
        }
    }
    }