<%@ Page Language="C#" AutoEventWireup="true" Inherits="admin_adminlogin" Codebehind="adminlogin.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Zartshop.com   :: Administrator :::</title>

    <meta name="description" content="" id="metaDesc" runat="server" />

<meta name="keywords" content="" id="metaKeywords" runat="server" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="form1" runat="server">


<div id="container">
	<div id="menus">
    	<a href="#" class="logo-txt">Zartshop.com</a>
        <div class="welcome">
       
        </div>
    </div>
    
    <div id="content" >
      <!-- Left Nav	-->
        <div id="left-nav">
        	</div>
        	
        	   <!-- Right Nav	-->
        <div id="right-nav" height="100%" style=" min-height:450px">
        
    
    <table  cellpadding="6" cellspacing="3"  style="padding-top:100px;padding-left:75px;" >
                	
                    	<tr>
                    	<td>
                    	 <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                            
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1"></asp:TextBox>
                       
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Username required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                         </td>
                    	</tr>
                    	<tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"  ValidationGroup="v1" 
                    TextMode="Password"></asp:TextBox>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Password required" ControlToValidate="TextBox2" 
                    ValidationGroup="v1">*</asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td></td>
            <td >
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="v1" ShowMessageBox="True" ShowSummary="False" />
                <asp:Button ID="Button1" runat="server" Text="Login" ValidationGroup="v1" 
                    onclick="Button1_Click" CssClass="login-btn" />
            </td>
          
            </tr>
            <tr>
                <td>
                
                </td>
                
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Forgot Password ?</asp:LinkButton>
                </td>
            </tr>

                    	</table>
                    	</div>
        
    </div>
    
    <div id="footer"></div>
    
</div>
</form>
</body>
</html>
