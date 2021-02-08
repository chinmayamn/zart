<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="shipping_address"  Codebehind="shipping-address.aspx.cs" %>
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
                    	<div class="navs"><span>1</span>	E mail login</div>
                    	<div class="navs selected"><span>2</span>	Shipping Address</div>
                    	<div class="navs"><span>3</span>	Order Summary</div>
                    	<div class="navs"><span>4</span> 	payment Options</div>
                    </div>
                    
                    <div class="e-mail">
                    	
                        <div class="form">
                        	
                            <div class="form-fu">
                            	<div class="name">Full Name</div>
                                <div class="name-fill">
                                  
                                    
                                    <asp:Literal ID="Label6" runat="server" Visible=false></asp:Literal>
                                    <asp:TextBox ID="TextBox1" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" ControlToValidate="TextBox1" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">Shipping Address</div>
                                <div class="name-fill">
                         
                                    <asp:TextBox ID="TextBox2" Rows="3" Columns="15" TextMode="MultiLine" runat="server" class="name-te" ValidationGroup="v1"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Shipping address required" ControlToValidate="TextBox2" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                       
                                
                                
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">Nearest land Mark</div>
                                <div class="name-fill">
                                
                                    <asp:TextBox ID="TextBox3" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                
                                
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Landmark required" ControlToValidate="TextBox3" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                       
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">City</div>
                                <div class="name-fill">
                                
                                    <asp:TextBox ID="TextBox4" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City required" ControlToValidate="TextBox4" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                       
                                
                                
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">State/Province/Region</div>
                                <div class="name-fill">
                                
                                    <asp:DropDownList ID="DropDownList1" class="name-en" runat="server" ValidationGroup="v1">
                                         <asp:ListItem Text="Select"></asp:ListItem>
                                <asp:ListItem Text="Andaman & Nicobar Islands"></asp:ListItem>
                                <asp:ListItem Text="Andhra Pradesh"></asp:ListItem>
                                <asp:ListItem Text="Arunachal Pradesh"></asp:ListItem>
                                <asp:ListItem Text="Assam"></asp:ListItem>
                                <asp:ListItem Text="Bihar"></asp:ListItem>
                                <asp:ListItem Text="Chandigarh"></asp:ListItem>
                                <asp:ListItem Text="Chattisgarh"></asp:ListItem>
                                <asp:ListItem Text="Dadra & Nagar Haveli"></asp:ListItem>
                                <asp:ListItem Text="Daman & Diu"></asp:ListItem>
                                <asp:ListItem Text="National Capital Territory of Delhi"></asp:ListItem>
                                <asp:ListItem Text="Goa"></asp:ListItem>
                                <asp:ListItem Text="Gujarath"></asp:ListItem>
                                <asp:ListItem Text="Haryana"></asp:ListItem>
                                <asp:ListItem Text="Himachal Pradesh"></asp:ListItem>
                                <asp:ListItem Text="Jammu & Kashmir"></asp:ListItem>
                                <asp:ListItem Text="Jharkhand"></asp:ListItem>
                                <asp:ListItem Text="Karnataka"></asp:ListItem>
                                <asp:ListItem Text="Kerala"></asp:ListItem>
                                <asp:ListItem Text="Lakshadweep"></asp:ListItem>
                                <asp:ListItem Text="Madhya Pradesh"></asp:ListItem>
                                <asp:ListItem Text="Maharashtra"></asp:ListItem>
                                <asp:ListItem Text="Manipur"></asp:ListItem>
                                <asp:ListItem  Text="Meghalaya"></asp:ListItem>
                                <asp:ListItem Text="Mizoram"></asp:ListItem>
                                <asp:ListItem Text="Nagaland"></asp:ListItem>
                                <asp:ListItem Text="Orissa"></asp:ListItem>
                                <asp:ListItem Text="Pondicherry"></asp:ListItem>
                                <asp:ListItem Text="Punjab"></asp:ListItem>
                                <asp:ListItem Text="Rajasthan"></asp:ListItem>
                                <asp:ListItem Text="Sikkim"></asp:ListItem>
                                <asp:ListItem Text="Tamilnadu"></asp:ListItem>
                                <asp:ListItem Text="Tripura"></asp:ListItem>
                                <asp:ListItem Text="Uttar Pradesh"></asp:ListItem>
                                <asp:ListItem Text="Uttarkhand"></asp:ListItem>
                                <asp:ListItem Text="West Bengal"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="State required" ControlToValidate="DropDownList1" ValidationGroup="v1" InitialValue="Select" Text="*"></asp:RequiredFieldValidator>
                       
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">Pin code</div>
                                <div class="name-fill">
                                    <asp:TextBox ID="TextBox5" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Postal code required" ControlToValidate="TextBox5" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                       
                                
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">Mobile</div>
                                <div class="name-fill">
                                
                                  <asp:TextBox ID="TextBox6" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Mobile no. required" ControlToValidate="TextBox6" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid mobile no." Text="*" ControlToValidate="TextBox6" ValidationExpression="\d{10}" ValidationGroup="v1"></asp:RegularExpressionValidator>
                                
                                </div>
                            </div>
                                <div class="form-fu">
                            	<div class="name">Shipping Email Id</div>
                                <div class="name-fill">
                                
                                  <asp:TextBox ID="TextBox7" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Email id required" ControlToValidate="TextBox7" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ErrorMessage="Invalid email id" Text="*" ControlToValidate="TextBox7" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="v1"></asp:RegularExpressionValidator>
                                
                                </div>
                            </div>
                            <div class="form-fu">
                            	<div class="name">Country</div>
                                <div class="name-fill" style=" padding:5px; color:#505050;"><b>India</b> ( Service 
                                    available only in India )</div>
                            </div>
                            <div class="form-fu" style="height:30px;"></div>
                            
                        </div>
                        
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="v1" ShowMessageBox="True" ShowSummary="False" />
                        <asp:Button ID="Button1" runat="server" Text="Continue" class="continue" 
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

