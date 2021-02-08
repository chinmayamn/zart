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

    public partial class about_us : System.Web.UI.Page
    {
        Cms cms = new Cms();
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = cms.getaboutus("About-Us");
            if (dt.Rows.Count == 0)
            {
            }
            else
            {
                Label1.Text = Server.HtmlDecode(dt.Rows[0]["description"].ToString());
            }
        }
    }
    

