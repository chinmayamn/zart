<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_users"  Codebehind="users.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript" src="../highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../highslide.css" />
<script type="text/javascript">
hs.graphicsDir = '../graphics/';
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'draggable-header';

</script>


<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Users</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
                
                <table>
                    <tr>
                        <td>
                         <asp:GridView AutoGenerateColumns=false ID="GridView1" runat="server" DataKeyNames="UserName" BorderWidth="1" CellPadding="5" CellSpacing="3" GridLines="Horizontal">
    <Columns>
    <asp:TemplateField ItemStyle-Width=30 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25>
    <ItemTemplate>
        <asp:CheckBox ID="CheckBox1" runat="server" />
    </ItemTemplate>
    </asp:TemplateField>
    
    <asp:TemplateField ItemStyle-Width=50 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" BackColor="Transparent" 
                        BorderColor="LightGray" BorderStyle="None" Font-Bold="True" ForeColor="Blue" 
                        OnClick="BtnDelete_Click" OnClientClick="showConfirm(this); return false;" 
                        Text="Delete" Width="50px" />
                </ItemTemplate>
             
            </asp:TemplateField>
            
          <asp:TemplateField  ItemStyle-Width=90 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25>
          <ItemTemplate>
          <a href=viewuser.aspx?id=<%#Eval("username")%> onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">
              <asp:Label ID="Label1" runat="server" Text="View Details"></asp:Label>
              <asp:Label ID="Label2" runat="server" Text=<%#Eval("mobilenumber")%> Visible=false></asp:Label>
          </a>
          </ItemTemplate>
          </asp:TemplateField>
          
          <asp:BoundField HeaderText="Username" DataField="username" ItemStyle-Width=200 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25 />
            <asp:BoundField HeaderText="Name" DataField="name"  ItemStyle-Width=150 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25/>
              <asp:BoundField HeaderText="Email" DataField="email" ItemStyle-Width=200 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25/>
                <asp:BoundField HeaderText="Mobile Number" DataField="mobilenumber" ItemStyle-Width=100 ItemStyle-HorizontalAlign="Center" ItemStyle-Height=25/>
                
            </Columns>
        
    </asp:GridView>
                        </td>
                    </tr>
                </table>
                
                </div>
                </div>
                </div>

</asp:Content>

