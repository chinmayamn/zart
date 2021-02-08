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
using System.Net.Mail;
using ZartDAL;
public partial class admin_my_order_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
            if (Request.QueryString["id"] != null)
            {
                string userid = Request.QueryString["userid"].ToString();
                getdata(userid);
                datafill();
                fillprofile(userid);
                orders();
                ordersproduct();
                fillorderstatusgrid();
            }
        }
    }
    public void getdata(string userid)
    {
       
        Order or = new Order();
        DataTable dt = or.getorderdet(userid);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Literal5.Text = dt.Rows[0]["name"].ToString() + "<br>" + dt.Rows[0]["address"].ToString() + "<br>" + "( " + dt.Rows[0]["landmark"].ToString() + " )" + "<br>" + dt.Rows[0]["city"].ToString() + " - " + dt.Rows[0]["postal"].ToString() + "<br>" + dt.Rows[0]["state"].ToString() + "<br>" + dt.Rows[0]["country"].ToString() + "<br>" + dt.Rows[0]["mobile"].ToString() + "<br>" + dt.Rows[0]["email"].ToString();
        }


    }
    public void orders()
    {

        string id = Convert.ToString(Request.QueryString["id"]);

        Order or = new Order();
        DataTable dt = or.select_ordersid(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Literal4.Text = dt.Rows[0]["Status"].ToString();
        }
    }
    public void datafill()
    {
        string id = Convert.ToString(Request.QueryString["id"]);

        Order or = new Order();
        DataTable dt = or.select_ordersid(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }


    }
    public void fillprofile(string userid)
    {
        Guid g=new Guid(userid);
        MembershipUser u = Membership.GetUser(g);
        string c = u.UserName.ToString();
        ProfileCommon comm = Profile.GetProfile(c);
        Literal6.Text = comm.name + "<br>" + comm.Address + " ( " + comm.Landmark + " ) " + "<br>" + comm.City + " - " + comm.PostalCode + "<br>" + comm.State + "<br>" + comm.Country + "<br>" + comm.Mobile + "<br>" + u.Email.ToString();
    }
    public void ordersproduct()
    {

        string id = Convert.ToString(Request.QueryString["id"]);

        Order or = new Order();
        DataTable dt = or.getordersproduct(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater2.DataSource = dt;
            Repeater2.DataBind();

            double p = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                p = p + Convert.ToDouble(dt.Rows[i]["linetotal"]);
            }



            Literal3.Text = p.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();
        revieworder ro = new revieworder();
        sms s = new sms();
       Order oo = new Order();
        string id = Request.QueryString["id"].ToString();
      

        string comment = txtcomment.Text;
        string status = ddlstatus.SelectedItem.Text.ToString();

        //updating status in orders table
        int i = Convert.ToInt32(id);
        ro.updateorderstatus(i, status);

        //updating status in order summary table

        DataTable dt1 = oo.getorders(id);
        string tempid = dt1.Rows[0]["id"].ToString();
        string cdate = dt1.Rows[0]["date"].ToString();
        string email = dt1.Rows[0]["email"].ToString();
        string mobile = dt1.Rows[0]["mobile"].ToString();

        string mobtemp = "Dear Customer your products order bearning no:" + tempid + " is in " + status + " status";

        s.SendSMS(mobile, mobtemp);


        //notify value
        if (CheckBox_notify.Checked == true)
        {

            ro.updateordersummary(i, cdate, status, comment);
            fillorderstatusgrid();
            txtcomment.Text = "";

            //append comment to mail                    
            if (Check_comment.Checked == true)
            {
                try
                {


                    string mto = email;
                    string mFrom = "chinmayamn@gmail.com";

                    if (mto != "" && mFrom != "")
                    {

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(mFrom);
                        message.To.Add(mto);
                        message.IsBodyHtml = true;


                        string temp = "Dear Customer your products order bearning no:" + tempid + " is in " + status + " status" + "<br>" + "Comments are as follows :" + comment;
                        message.Body = temp;
                        message.Subject = "Order Status";

                        SmtpClient smtp = new SmtpClient("localhost", 25);

                        smtp.Send(message);
                        message.Dispose();

                        MessageBox msg1 = new MessageBox();
                        msg1.Show("Mail has been sent successfully");


                    }

                    else
                    {
                        MessageBox msg2 = new MessageBox();
                        msg2.Show("Send feed back again after some time");

                    }

                }

                catch (Exception ex)
                {

                    MessageBox msg3 = new MessageBox();
                    msg3.Show(ex.ToString());

                }
            }


//dont append comment to mail

            else
            {
                try
                {


                    string mto = email;
                    string mFrom = "chinmayamn@gmail.com";

                    if (mto != "" && mFrom != "")
                    {

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(mFrom);
                        message.To.Add(mto);
                        message.IsBodyHtml = true;


                        string temp = "Dear Customer your products order bearning no:" + tempid + " is in " + status + " status";
                        message.Body = temp;
                        message.Subject = "Order Status";

                        SmtpClient smtp = new SmtpClient("localhost", 25);

                        smtp.Send(message);
                        message.Dispose();

                        MessageBox msg1 = new MessageBox();
                        msg1.Show("Mail has been sent successfully");


                    }

                    else
                    {
                        MessageBox msg2 = new MessageBox();
                        msg2.Show("Send feed back again after some time");

                    }

                }

                catch (Exception ex)
                {

                    MessageBox msg3 = new MessageBox();
                    msg3.Show(ex.ToString());

                }
            }

        }
        else
        {

            ro.updateordersummary(i, cdate, status, comment);
            fillorderstatusgrid();
            txtcomment.Text = "";
            msg.Show("Order Summary updated successfully");
        }
        fillorderstatusgrid();
        orders();
    }

    public void fillorderstatusgrid()
    {
        revieworder ro = new revieworder();

        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet ds = ro.fillorderstatus(id);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Literal1.Visible = true;
           
           Repeater3.Visible = false;
        }
        else
        {
            Literal1.Visible = false;
            Repeater3.Visible = true;
            Repeater3.DataSource = ds;
            Repeater3.DataBind();
        }
    }
    protected void Repeater3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Order o = new Order();
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(Repeater3.DataKeys[e.RowIndex].Value);
        o.deleteordersummary(id);
        fillorderstatusgrid();
        msg.Show("Order summary deleted successfully");
    }
}
