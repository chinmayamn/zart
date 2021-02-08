<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_payment_gateway"  Codebehind="payment-gateway.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Payment Gateway</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
                
                <table cellpadding="6" cellspacing="3">
<tr>
    <td>
    Category:
    </td>
    <td>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" CellPadding="6" 
            CellSpacing="3" RepeatDirection="Horizontal" RepeatColumns="3" > 
           
            <asp:ListItem Text="Paypal"></asp:ListItem>
            <asp:ListItem Text="Times of Money"></asp:ListItem>
            <asp:ListItem Text="EBS"></asp:ListItem>
            <asp:ListItem Text="TechProcess"></asp:ListItem>
            <asp:ListItem Text="Booking"></asp:ListItem>
        </asp:CheckBoxList>
    </td>
</tr>

<tr>
    <td>
    
    </td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" />
    </td>
</tr>
    
</table>
                      </div>
                
            </div>
        </div>
        
        
</asp:Content>

