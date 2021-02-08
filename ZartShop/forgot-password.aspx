<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="forgot_password"  Codebehind="forgot-password.aspx.cs" %>
<%@ Register Src="~/cart.ascx" TagName="cart" TagPrefix="ucl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Content	-->
        <div class="content">
        	<ul class="navi">
                <li><a href="index.aspx">Home</a></li>
                <li>Forgot Password</li>
            </ul>
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <div class="navigating">
                    	<div class="navs selected"><span>1</span>Forgot Password</div>
                    </div>
                    
                    <div class="e-mail">
                    	<div class="eml"><b>Email Address :</b></div>
                        <div class="e-txt">
                        	
                            <asp:TextBox ID="TextBox1" runat="server" class="ems" ValidationGroup="v1" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required" Text="*" ControlToValidate="TextBox1" ValidationGroup="v1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid username" ControlToValidate="TextBox1" ValidationGroup="v1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" >*</asp:RegularExpressionValidator>
                        	
                        	<br />
                            Your Password will be mailed to your Email Address
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="v1" ShowMessageBox="True" ShowSummary="False" />
                     
                        
                        <asp:Button ID="Button1" runat="server" Text="Send My Password" class="continue top"  
                                    ValidationGroup="v1" onclick="Button1_Click"/>
                    </div>
                    
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

