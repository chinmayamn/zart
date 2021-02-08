<%@ Page Language="C#" AutoEventWireup="true" Inherits="admin_viewuser" Codebehind="viewuser.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .bold
    {
     font-weight:bold;
    }
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
   
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <table cellpadding="6" cellspacing="4">
        <tr class="light">
            <td class="bold">
            Username:
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
            </td>
        </tr>
         <tr >
            <td class="bold">
            Password:
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ></asp:Label>
            </td>
        </tr>
        
        <tr class="light">
            <td class="bold">
            Name:
            </td>
            <td>
               <asp:Label ID="Label3" runat="server" ></asp:Label>
            </td>
        </tr>
        
          <tr>
            <td class="bold">
            Email:
            </td>
            <td>
               <asp:Label ID="Label5" runat="server" ></asp:Label>
            </td>
        </tr>
          <tr class="light">
            <td class="bold">
            Mobile:
            </td>
            <td>
               <asp:Label ID="Label6" runat="server" ></asp:Label>
            </td>
        </tr>
          
          <tr class="light"> 
            <td class="bold">
            Address:
            </td>
            <td>
               <asp:Label ID="Label8" runat="server" ></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="bold">
           Landmark:
            </td>
            <td>
               <asp:Label ID="Label7" runat="server" ></asp:Label>
            </td>
        </tr>
        
        
         <tr>
            <td class="bold"> 
           City:
            </td>
            <td>
               <asp:Label ID="Label9" runat="server" ></asp:Label>
            </td>
        </tr>
          <tr class="light">
            <td class="bold"> 
           State:
            </td>
            <td>  <asp:Label ID="Label10" runat="server" ></asp:Label>
              
            </td>
        </tr>
        
         <tr class="light">
            <td class="bold"> 
           Pincode:
            </td>
            <td>  <asp:Label ID="Label4" runat="server" ></asp:Label>
              
            </td>
        </tr>
      
         <tr class="light">
            <td class="bold"> 
           Country:
            </td>
            <td>  <asp:Label ID="Label11" runat="server" ></asp:Label>
              
            </td>
        </tr>
         <tr  >
            <td class="bold">
              SMS Content:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Columns="19" Rows="5" 
                    TextMode="MultiLine" ValidationGroup="v1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Content required" ControlToValidate="TextBox1" 
                    ValidationGroup="v1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
       <tr class="light">
            <td class="bold">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Send Sms"  ValidationGroup="v1"
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
