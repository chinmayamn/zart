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
using roi_key;
using System.Threading;
using ZartDAL;
public partial class login : System.Web.UI.Page
{
    admin ad = new admin();
    MessageBox msg = new MessageBox();
    KeyGenerate KeyGen = new KeyGenerate();
    Newsletter newsletter = new Newsletter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        int i = 0;
        string RandomKey = null;

        KeyGen = new KeyGenerate();
        KeyGen.KeyLetters = "abcdefghjklmnpqrstuvwxyz";
        KeyGen.KeyNumbers = "23456789";
        KeyGen.KeyChars = 9;
        int mExist = 0;
        int mExist1 = 0;
        for (i = 0; i <= 1; i++)
        {
            RandomKey = KeyGen.Generate().ToUpper();
        }


        if (RadioButtonList1.SelectedItem.Value == "1")
        {

            MembershipUser mem = Membership.GetUser(TextBox1.Text);
            if (mem == null)
            {
                MembershipCreateStatus status;
                MembershipUser newuser = Membership.CreateUser(TextBox1.Text, RandomKey, TextBox1.Text, "a", "a", true, out status);
                if (newuser == null)
                {
                    msg.Show(GetErrorMessage(status));

                }
                else
                {

                    ProfileCommon pc = (ProfileCommon)ProfileCommon.Create(TextBox1.Text, true);
                    Roles.AddUserToRole(TextBox1.Text, "user");

                    mailing mail = new mailing();
                    mail.mymail(TextBox1.Text,"Dear customer, you are successfully registered with ZartShop.com. Account details are as follows <br/>UserName : " + TextBox1.Text + "<br>Password : "+ RandomKey+ "<br/><br/>Regards,<br/>ZartShop.com" ,"ZartShop Registration");

                    msg.Show("Registered successfully");
                    newsletter.addnewsletter(TextBox1.Text);
                    System.Threading.Thread.Sleep(1000);
                    FormsAuthentication.SetAuthCookie(TextBox1.Text, true);
                   
                    Response.Redirect("shipping-address.aspx?id=" + RadioButtonList1.SelectedItem.Value.ToString());
                }
            }
            else
            {
                msg.Show("Email Id already registered");

            }

        }
        else
        {
            DataTable dt = ad.checkuser(TextBox1.Text, TextBox2.Text);
            if (dt.Rows.Count == 0)
            {
                msg.Show("Invalid username and password");
            }
            else
            {

                if (Request.QueryString["returnurl"] != null)
                {
                    string te1 = Request.QueryString["returnurl"].ToString();

                    try
                    {
                        FormsAuthentication.SetAuthCookie(TextBox1.Text, true);
                       
                      
                        Response.Redirect(te1);


                    }
                    catch(Exception ex)
                    {
                    }

                }
                else
                {
                string te = "shipping-address.aspx?id="+ RadioButtonList1.SelectedItem.Value.ToString();
                    FormsAuthentication.SetAuthCookie(TextBox1.Text, true);
                   
                    Response.Redirect(te);
             }

            }
             
        }
    

    }

    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";

            case MembershipCreateStatus.InvalidPassword:
                return "Password should be of minimum of 6 characters and should be alphanumeric";

            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidAnswer:
                return "The password retrieval answer provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidQuestion:
                return "The password retrieval question provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            case MembershipCreateStatus.Success:

               






                return "Registered Successfully";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Value == "1")
        {
            TextBox2.ValidationGroup = null;
        }
        else
        {
            TextBox2.ValidationGroup = "v1";
        }
    }
}
