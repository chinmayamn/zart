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
public partial class admin_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldata();
        }
    }
    public void filldata()
    {
       Newsletter ad = new Newsletter();
        DataTable dt = ad.getnewsletters();
        if (dt.Rows.Count == 0)
        {
            Literal1.Visible = true;
            GridView1.Visible = false;
        }
        else
        {
            Literal1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = dt; GridView1.DataBind();

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        admin ad = new admin();
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
      
        MessageBox msg=new MessageBox();
        ad.deletenewsuser(id); filldata();
        msg.Show("User successfully unsubscribed from newsletter");
       
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        filldata();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            CheckBox c = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            c.Checked = true;



        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            CheckBox c = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            c.Checked = false;



        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mailing m = new mailing();
        MessageBox msg = new MessageBox(); int z = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            CheckBox c = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            Literal l1 = (Literal)GridView1.Rows[i].FindControl("Literal1");


            if (c.Checked == true)
            {
                m.mymail(l1.Text, uc1.Value, TextBox1.Text);
                z = 1;
            }
        }
        if (z == 1)
        {
            TextBox1.Text = "";
            msg.Show("Newsletter sent successfully");

        }
        else
        {
            msg.Show("Select subscribers");
        }

    }
}
