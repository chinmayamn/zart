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
using System.IO;
using System.Web.Profile;
using ZartDAL;
public partial class admin_users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            fillgrid();
        }


    }

    public void fillgrid()
    {
        admin ad = new admin();
        int totrec;
        ArrayList list = new ArrayList(Roles.GetUsersInRole("user"));
        //MembershipUserCollection coll = // Roles.GetUsersInRole(ddlrole.SelectedItem.Text);
        DataTable dtt = new DataTable();
        dtt.Columns.Add("UserName");
        dtt.Columns.Add("Name");
        dtt.Columns.Add("Email");
        dtt.Columns.Add("MobileNumber");


        int j = 0;
        foreach (string strrr in list)
        {
            MembershipUserCollection coll = Membership.FindUsersByName(strrr);
            foreach (MembershipUser user1 in coll)
            {
                ProfileCommon com = Profile.GetProfile(user1.UserName);
                string a = user1.ProviderUserKey.ToString();
                dtt.Rows.Add(user1.UserName,  com.name , user1.Email, com.Mobile);
                ++j;


            }
        }


        totrec = j;
        GridView1.DataSource = dtt;
        GridView1.DataBind();
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        admin ad = new admin();

        Button btnDelete = sender as Button;
        GridViewRow row = (GridViewRow)btnDelete.NamingContainer;

        string usernme = GridView1.DataKeys[row.RowIndex].Value.ToString();
        MembershipUser u = Membership.GetUser(usernme);
        string y = u.ProviderUserKey.ToString();
        Membership.DeleteUser(usernme);

        ProfileManager.DeleteProfile(usernme);
        ad.deleteuser(y);
        fillgrid();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        int totrec;
        ArrayList list = new ArrayList(Roles.GetUsersInRole("user"));
        //MembershipUserCollection coll = // Roles.GetUsersInRole(ddlrole.SelectedItem.Text);
        DataTable dtt = new DataTable();
        dtt.Columns.Add("UserName");
        dtt.Columns.Add("Password");

        dtt.Columns.Add("Name");

        dtt.Columns.Add("Email");
        dtt.Columns.Add("Mobile");

        dtt.Columns.Add("Address");
        dtt.Columns.Add("LandMark");
        dtt.Columns.Add("City");
        dtt.Columns.Add("State");


        int j = 0;
        foreach (string strrr in list)
        {
            MembershipUserCollection coll = Membership.FindUsersByName(strrr);
            foreach (MembershipUser user1 in coll)
            {
                MembershipUser u = Membership.GetUser(user1.UserName);
                Guid a = new Guid(u.ProviderUserKey.ToString());
                string temppass = string.Empty;
                DataTable ds = ad.getuserspassword(a);
                if (ds.Rows.Count == 0)
                {
                }
                else
                {
                    temppass = ds.Rows[0]["password"].ToString();
                }



                ProfileCommon com = Profile.GetProfile(user1.UserName);

                dtt.Rows.Add(user1.UserName, temppass, com.name, user1.Email, com.Mobile, com.Address,  com.City, com.State);
                ++j;


            }
        }


        totrec = j;
        ExportDataSetToExcel(dtt, "data.xls");
    }


    public void ExportDataSetToExcel(DataTable ds, string filename)
    {
        HttpResponse response = HttpContext.Current.Response;

        // first let's clean up the response.object
        response.Clear();
        response.Charset = "";

        // set the response mime type for excel
        response.ContentType = "application/vnd.ms-excel";
        response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");

        // create a string writer
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter htw = new HtmlTextWriter(sw))
            {
                // instantiate a datagrid
                DataGrid dg = new DataGrid();
                dg.DataSource = ds;
                dg.DataBind();
                dg.RenderControl(htw);
                response.Write(sw.ToString());
                response.End();
            }
        }
    }

}
