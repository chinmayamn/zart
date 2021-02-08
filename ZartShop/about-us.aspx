<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="about_us"  Codebehind="about-us.aspx.cs" %>
<%@ Register Src="~/cart.ascx" TagName="cart" TagPrefix="ucl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- Content	-->
        <div class="content">
        	<ul class="navi">
                <li><a href="index.aspx">Home</a></li>
                <li>About Us</li>
            </ul>
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <asp:Literal ID="Label1" runat="server"></asp:Literal>
                        
                    
                  
                    
                </div>
                <!-- End of Login Box	-->        
                
                <!-- Right Shopping Cart	-->
                <ucl:cart ID="cart1" runat="ServeR"></ucl:cart>
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->

</asp:Content>

