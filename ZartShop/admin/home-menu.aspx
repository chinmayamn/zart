<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_home_menu"  Codebehind="home-menu.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b> Home Menu Selection </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	               <div class="top-head">
                	<a href="home-menu.aspx" class="select">Home Menu</a>
                    <a href="new-arrivals.aspx" >New Arrivals</a>
                     <a href="en-gadgets.aspx" >Entertainment Gadgets</a>
                      <a href="hot-offers.aspx" >Hot Offers</a>
                       <a href="exclusive.aspx" >Zart Exclusive</a>
                </div>    
                
                <div class="cont" align="Center">
                
                
<div align="center">
<table cellpadding="6" cellspacing="3">
<tr>
    <td>
    Category:
    </td>
    <td>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" CellPadding="6" 
            CellSpacing="3" RepeatDirection="Horizontal" RepeatColumns="6" 
            ondatabound="CheckBoxList1_DataBound">
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
        </div>
</asp:Content>

