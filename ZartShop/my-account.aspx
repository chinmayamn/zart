<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="my_account"  Codebehind="my-account.aspx.cs" %>
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
                    <div class="shipping-form">
                        	<div class="form-heading">Address Details 
                        	
                        	
                        	
                                <asp:LinkButton ID="LinkButton1" runat="server" class="edit" 
                                    onclick="LinkButton1_Click">[ EDIT ]</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="edit"  ValidationGroup="v1"
                                    onclick="LinkButton2_Click">[ SAVE ]</asp:LinkButton>
                        	</div>
                            <div class="fields2"><p class="first">Name</p><p class="sec"> 
                           
                                <asp:Literal ID="Label1" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox1" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" ControlToValidate="TextBox1" ValidationGroup="v1">*</asp:RequiredFieldValidator>
                            
                            </p></div>
                          
                            <div class="fields2"><p class="first">Address</p><p class="sec"> 
                            
                            
                           
                            
                                <asp:Literal ID="Label2" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox2" runat="server" Rows="3" Columns="15" TextMode="MultiLine"  class="name-te" ValidationGroup="v1"></asp:TextBox>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="Address required" Text="*" ControlToValidate="TextBox2" ValidationGroup="v1">*</asp:RequiredFieldValidator>
                            
                            </p></div>
                             <div class="fields2"><p class="first">LandM ark</p><p class="sec">
                             
                              
                              
                                 <asp:Literal ID="Label3" runat="server"></asp:Literal>
                                 <asp:TextBox ID="TextBox3" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="Landmark required" ControlToValidate="TextBox3" 
                                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                              </p></div>
                            <div class="fields2"><p class="first">City</p><p class="sec">
                            
                           
                                <asp:Literal ID="Label4" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox4" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="City required" ControlToValidate="TextBox4" ValidationGroup="v1">*</asp:RequiredFieldValidator>
                             </p></div>
                            <div class="fields2"><p class="first">State / Province</p><p class="sec"> 
                            
                         
                                <asp:Literal ID="Label5" runat="server"></asp:Literal>
                                <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="v1" width="230">
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
                                
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ErrorMessage="Select state" ControlToValidate="DropDownList1" 
                                        InitialValue="Select" ValidationGroup="v1">*</asp:RequiredFieldValidator>
                            </p></div>
                            <div class="fields2"><p class="first">Pin Code</p><p class="sec">
                            
                             
                                <asp:Literal ID="Label6" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox5" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ErrorMessage="Postal code required" ControlToValidate="TextBox5" 
                                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                             
                             </p></div>
                            <div class="fields2"><p class="first">Country / Region</p><p class="sec">
                            
                        
                                <asp:Literal ID="Label7" runat="server"></asp:Literal>
                             
                             </p></div>
                            
                            
                        	<div class="form-heading">Contact Details <a href="#" class="edit"></a></div>
                            
                            <div class="fields2"><p class="first">Mobile</p><p class="sec">
                            
                            
                             
                                <asp:Literal ID="Label8" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox6" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ErrorMessage="Mobile no. required" ControlToValidate="TextBox6" 
                                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator  ValidationExpression="\d{10}" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid mobile no." Text="*"  ControlToValidate="TextBox6" ValidationGroup="v1"></asp:RegularExpressionValidator>
                            </p></div>
                         
                         
                            <div class="fields2"><p class="first">Shipping Email Id</p><p class="sec"> 
                            
                            
                                <asp:Literal ID="Label9" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox8" runat="server" class="name-en" ValidationGroup="v1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ErrorMessage="Email id required" ControlToValidate="TextBox8" 
                                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ID="RegularExpressionValidator2" runat="server" 
                                    ErrorMessage="Invalid email id" Text="*"  ControlToValidate="TextBox8" 
                                    ValidationGroup="v1"></asp:RegularExpressionValidator>
                            </p></div>
                         
                         
                             
                            
                        	<div class="form-heading">User ID and password <a href="#" class="edit"></a></div>
                            
                            <div class="fields2"><p class="first">User Id /Email</p><p class="sec"> 
                            
                           
                                <asp:Literal ID="Label10" runat="server"></asp:Literal>
                            
                            
                            </p></div>
                            <div class="fields2"><p class="first">Password</p><p class="sec"> 
                            
                           
                            
                                <asp:Literal ID="Label11" runat="server"></asp:Literal>
                                <asp:TextBox ID="TextBox7" runat="server" class="name-en" ValidationGroup="v1" ></asp:TextBox>
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Password required" ControlToValidate="TextBox7" ValidationGroup="v1">*</asp:RequiredFieldValidator>
                            </p></div>
                            
                           
                        </div><div class="e-mail">
                    	
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
                                    ShowSummary="False" ValidationGroup="v1" />
                        
                      
                        
                            <asp:Button ID="Button1" runat="server" Text="Save" ValidationGroup="v1" class="continue"  OnClick="LinkButton2_Click"/>
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

