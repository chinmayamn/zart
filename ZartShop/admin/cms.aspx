<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_cms"  Codebehind="cms.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Content Management System </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
<table>
    <tr>
        <td>
            Page:
      
            <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="v1" 
                AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="Select"></asp:ListItem>
        
            <asp:ListItem Text="About-Us"></asp:ListItem>
            <asp:ListItem Text="Contact-us"></asp:ListItem>
            <asp:ListItem Text="Our Team"></asp:ListItem>
            <asp:ListItem Text="Work with us"></asp:ListItem>
            <asp:ListItem Text="Sitemap"></asp:ListItem>
            <asp:ListItem Text="Terms of Use"></asp:ListItem>
            <asp:ListItem Text="Privacy Policy"></asp:ListItem>
            <asp:ListItem Text="Cancellation Policy"></asp:ListItem>
            <asp:ListItem Text="Return Policy"></asp:ListItem>
            <asp:ListItem Text="Exchange Policy"></asp:ListItem>
            <asp:ListItem Text="Shipping-Packing"></asp:ListItem>
            <asp:ListItem Text="Vouchers-Discount Coupons"></asp:ListItem>
            <asp:ListItem Text="Guaranteed Lowest Prices"></asp:ListItem>
            <asp:ListItem Text="Zero damage risk (Insurance)"></asp:ListItem>
            <asp:ListItem Text="Quality check before dispatch"></asp:ListItem>
             <asp:ListItem Text="Dispatch in 48 hrs"></asp:ListItem>
              <asp:ListItem Text="Cash on Delivery option"></asp:ListItem>
               <asp:ListItem Text="7 day moneyback guarantee"></asp:ListItem>
                <asp:ListItem Text="Original products, no fakes"></asp:ListItem>
                 <asp:ListItem Text="All day call center"></asp:ListItem>
                  <asp:ListItem Text="Bulk Order Inquiry"></asp:ListItem>
                   <asp:ListItem Text="Corporate Program"></asp:ListItem>
                    <asp:ListItem Text="Advertise With Us"></asp:ListItem>
                     <asp:ListItem Text="Affiliate New"></asp:ListItem>
                     <asp:ListItem Text="Help"></asp:ListItem>
                     
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select page" ValidationGroup="v1" InitialValue="Select" ControlToValidate="DropDownList1" Text="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
    <td>
    
    <FCKeditorV2:FCKeditor ID="uc1" runat="server" Width=750 BasePath="~/fckeditor/" 
                Height="400px"> </FCKeditorV2:FCKeditor>
    </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
            <asp:Button ID="Button2"
                runat="server" Text="Update" onclick="Button2_Click" />
        </td>
    </tr>
    </table>
       </div>
                
            </div>
        </div>
</asp:Content>

