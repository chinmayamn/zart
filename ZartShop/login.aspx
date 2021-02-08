<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="login"  Codebehind="login.aspx.cs" %>
<%@ Register Src="~/cart.ascx" TagName="cart" TagPrefix="ucl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   
  
	<!-- Content	-->
        <div class="content">
        
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <div class="navigating">
                    	<div class="navs selected"><span>1</span>	E mail login</div>
                    	<div class="navs"><span>2</span>	Shipping Address</div>
                    	<div class="navs"><span>3</span>	Order Summary</div>
                    	<div class="navs"><span>4</span> 	payment Options</div>
                    </div>
                    
                    <div class="e-mail">
                    	<div class="eml"><b>Email Address :</b> <br /> (Required)</div>
                        <div class="e-txt">
                            <asp:TextBox ID="TextBox1" runat="server" class="ems" ValidationGroup="v1" ></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email Id required" ValidationGroup="v1" ControlToValidate="TextBox1" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="Invalid email id" ControlToValidate="TextBox1" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="v1">*</asp:RegularExpressionValidator>
                            
                            <br />
                            Your order details will be sent to this email address.
                        </div>
                        
                        <div class="no-pass">
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"  
                                RepeatDirection="Horizontal" CellPadding="6" CellSpacing="3" 
                                AutoPostBack="True" 
                                onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                
                                <asp:ListItem Text="" Value="1" class="check-pass without"></asp:ListItem>
                                <asp:ListItem Text="" Value="2" class="check-pass"></asp:ListItem>    
                            </asp:RadioButtonList>
                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select login type" Text="*" ControlToValidate="RadioButtonList1" ValidationGroup="v1"></asp:RequiredFieldValidator>
                            <div class="c-pass" style="margin-top:-17px;">
                               <%-- <input type="radio" name="password"   />--%>
                                <div class="pass-cont">
                                	<b>Continue without password</b> <br />
									(You do not need a password)
                                </div>
                            </div>
                           
                            <div class="c-pass" style="margin-top:-17px; float:right;" >
                                <div class="pass-cont">
                                	<b>I have a account and password</b><br />
									Sign in to your account and checkout faster
                                    
                                    <div class="pass">
                                    	Password :
                                        <asp:TextBox ID="TextBox2" runat="server" class="pass-t"  TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required" Text="*" ControlToValidate="TextBox2" ></asp:RequiredFieldValidator>
                                    	
                                        <a href="forgot-password.aspx" class="forgot">Forgot your password ?</a>
                                    </div>
                                </div>
                            </div>
                          
                        	
                            
                            
                        	
                             </ContentTemplate>
    </asp:UpdatePanel>
                            
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
                                    ShowSummary="False" ValidationGroup="v1" />
                      <asp:Button ID="Button1" class="continue" ValidationGroup="v1" runat="server" 
                                    Text="Continue" onclick="Button1_Click" />
                        
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

