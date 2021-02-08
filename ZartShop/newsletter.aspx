<%@ Page Language="C#" AutoEventWireup="true" Inherits="newsletter" Codebehind="newsletter.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table >

    

     <tr>
        <td  >
            &nbsp;
           Email :</td>
        <td >
            <asp:TextBox ID="TextBox1" runat="server" Width="128px"
               ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Email Id required" 
                ValidationGroup="v1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="v1">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
        </td>
        <td>
           &nbsp; <asp:Button ID="Button1" runat="server" Text="Subscribe" 
                onclick="Button1_Click" ValidationGroup="v1" 
               />
        </td>
    </tr>
</table>

    </div>
    </form>
</body>
</html>
