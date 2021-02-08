<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="contact_us"  Codebehind="contact-us.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
    
    
   
 	<!-- Content	-->
        <div class="content">
        	<ul class="navi">
                <li><a href="index.aspx">Home</a></li>
                <li>
                   <%#Eval("type") %></li>
            </ul>
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
           		<!-- Content	-->
                <div class="contnt">
                	<h2><%#Eval("type") %></h2>
                    <div class="editor">
                    <%# Server.HtmlDecode(Eval("description").ToString())%>
                    </div>
                </div>
                <!-- End of Content	-->
               
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->



 </ItemTemplate>
    </asp:Repeater>
</asp:Content>

