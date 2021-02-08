using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data.SqlClient;
public class Items
{
    public string item_id; public string item_rank;
   
}
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    [WebMethod]

    public string save_categorysort(Items[] items)
    {
        try
        {
            string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["cons"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            string sql = "";
            //create update statements from Items array which sent as parameter
            foreach (Items item in items)
            {
                sql += "update category set visible=1 where  id = '" + item.item_id + "'";
            }
            cmd.CommandText = sql;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return "";
        }
        catch
        {
            return "";
        }
    }
    [WebMethod]
    public string save_categorysort1(Items[] items)
    {
        try
        {
            string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["cons"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            string sql = "";
            //create update statements from Items array which sent as parameter
            foreach (Items item in items)
            {
                sql += "update category set visible=-1 where  id = '" + item.item_id + "'";
            }
            cmd.CommandText = sql;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return "";
        }
        catch
        {
            return "";
        }
    }
    
}

