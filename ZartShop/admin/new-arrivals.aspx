<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_new_arrivals" Title="" Codebehind="new-arrivals.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b> New Arrivals </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	               <div class="top-head">
                	<a href="home-menu.aspx" >Home Menu</a>
                    <a href="new-arrivals.aspx" class="select">New Arrivals</a>
                     <a href="en-gadgets.aspx"  >Entertainment Gadgets</a>
                      <a href="hot-offers.aspx" >Hot Offers</a>
                       <a href="exclusive.aspx" >Zart Exclusive</a>
                </div>    
                
                <div class="cont" align="Center">
                
                
                <table>
                
                <tr>
                
                <td>
                    Category :
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width=300 
                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                </tr>
                <tr>
                <td>
                    Sub-Category:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" Width=300 
                        AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                </tr>
                <tr>
                    <td>
                        Sub-Sub-Category:                     </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" Width=300 
                            AutoPostBack="True" onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
               </table> <table>
                <tr>
                <td>
                 <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False" AllowPaging="True" 
                CellPadding="6" CellSpacing="3" onrowdatabound="GridView1_RowDataBound"> 
                <Columns>
                
                  <asp:TemplateField>
    <ItemTemplate>
        <asp:CheckBox ID="CheckBox1" runat="server" />
        <asp:Label ID="Label3" runat="server" Text=<%#Eval("newarrival")%> Visible=false></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
                
                
                   <asp:BoundField HeaderText="Product Name" DataField="pname" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
           
            
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75"   >
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Width="80" ImageUrl=<%#Eval("image") %> />
                    <asp:Label ID="Label2" runat="server"  Visible=false Text=<%#Eval("id")%>></asp:Label>
             
                </ItemTemplate>
            </asp:TemplateField>
                                  </Columns>
            </asp:GridView>
                
                </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="No products for this category"></asp:Label>
                    </td>
                </tr>
                <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Add New Arrivals" 
                        onclick="Button1_Click" />
                </td>
                </tr>
                </table>
                </div>
                </div>
                </div>
</asp:Content>

