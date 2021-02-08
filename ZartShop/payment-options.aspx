<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="payment_options"  Codebehind="payment-options.aspx.cs" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/zartshop.js"></script>



<script type="text/javascript" src="js/payment-tabs.js"></script>

<script src="js/jquery.min1.js" type="text/javascript"></script>
 	<!-- Content	-->
        <div class="content">
        
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <div class="navigating">
                   	  <div class="navs"><span>1</span>	E mail login</div>
                    	<div class="navs"><span>2</span>	Shipping Address</div>
                    	<div class="navs"><span>3</span>	Order Summary</div>
                   	  <div class="navs selected"><span>4</span> 	payment Options</div>
                    </div>
                    
                  <div class="full-w">                  
                    <ul class='tabs'>
                    
                     
                          <li><a href="#tab2" id=a1 runat=server>Paypal</a></li>
                        <li><a href="#tab3" id=a2 runat=server>Times of Money</a></li>
                        <li><a href='#tab4' id=a3 runat=server>EBS</a></li>
                           <li><a href='#tab5' id=a4 runat=server>TechProcess</a></li>
                        <li><a href='#tab6' id=a5 runat=server>Booking</a></li >
                        
                     
                     
                    </ul>
                 
                    <div id="tab2"  runat="server">
                        
                        <div class="tab-cont">
                        	<p><b>Amount Payable on Delivery via Paypal : Rs.
                                <asp:Literal ID="Label1" runat="server"></asp:Literal>
                        	
                        	</b></p>
                            
                            <div class="ship">
                            	<p><b>Shipping Address</b><br />
                                   
                                    <asp:Literal ID="Label4" runat="server"></asp:Literal>
                                    <div class="e-mail" id="e_mail" runat="server">
                    	
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
                       
                    </div>
                                    <br />
							
								 <asp:LinkButton ID="LinkButton1" runat="server" class="edit" 
                                    onclick="LinkButton1_Click">[ EDIT SHIPPING ADDRESS]</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="edit"  ValidationGroup="v1"
                                    onclick="LinkButton2_Click">[ SAVE ]</asp:LinkButton>
								
								
								</p>
                    		   <p style="margin:40px 0 0 0;"><b>Note:</b> After clicking on the "Pay" button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to Zartshop.com to view details of your order.</p>
                    			<asp:Button ID="Button2" runat="server" Text="Place Order" class="continue top" 
                                                onclick="Button1_Click" />
                              
                            </div>
                        </div>
                        
                    </div>
                    <div id="tab3" runat="server">
                        
                        <div class="tab-cont">
                        	<p><b>Amount Payable via Net Banking : Rs.
                        	
                                <asp:Literal ID="Label3" runat="server"></asp:Literal>
                        	
                        	</b></p>
                            
                            <div class="ship">
                            	<p>Choose Your Bank :
                                <select class="bank">
                                	<option>------Select Bank------</option>
                               	</select> </p>
                                
                                <p style="margin:40px 0 0 0;"><b>Note:</b> After clicking on the "Pay" button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to Zartshop.com to view details of your order.</p>
                    			<asp:Button ID="Button3" runat="server" Text="Place Order" class="continue top" 
                                                onclick="Button3_Click" />
                            </div>
                        </div>
                        
                    </div>
                     <div id='tab4' runat="server">
                        
                        <div class="tab-cont">
                        	<p><b>Amount Payable via Net Banking : Rs.
                                <asp:Literal ID="Label7" runat="server"></asp:Literal>
                        	
                        	</b></p>
                            
                            <div class="ship">
                            	<p>Choose Your Bank :
                                <select class="bank">
                                	<option>------Select Bank------</option>
                               	</select> </p>
                                
                                <p style="margin:40px 0 0 0;"><b>Note:</b> After clicking on the "Pay" button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to Zartshop.com to view details of your order.</p>
                    			<asp:Button ID="Button1" runat="server" Text="Place Order" class="continue top" 
                                                onclick="Button3_Click" />
                            </div>
                        </div>
                        
                    </div>
                     <div id='tab5' runat="server">
                        
                        <div class="tab-cont">
                        	<p><b>Amount Payable via Net Banking : Rs.
                        	
                                <asp:Literal ID="Label8" runat="server"></asp:Literal>
                        	</b></p>
                            
                            <div class="ship">
                            	<p>Choose Your Bank :
                                <select class="bank">
                                	<option>------Select Bank------</option>
                               	</select> </p>
                                
                                <p style="margin:40px 0 0 0;"><b>Note:</b> After clicking on the "Pay" button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to Zartshop.com to view details of your order.</p>
                    			<asp:Button ID="Button4" runat="server" Text="Place Order" class="continue top" 
                                                onclick="Button3_Click" />
                            </div>
                        </div>
                        
                    </div>
                                 <div id='tab6' runat="server">
                        
                        <div class="tab-cont">
                        	<p><b>Amount Payable via Net Banking : Rs.
                                <asp:Literal ID="Label9" runat="server"></asp:Literal>
                        	
                        	</b></p>
                            
                            <div class="ship">
                            	<p>Choose Your Bank :
                                <select class="bank">
                                	<option>------Select Bank------</option>
                               	</select> </p>
                                
                                <p style="margin:40px 0 0 0;"><b>Note:</b> After clicking on the "Pay" button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to Zartshop.com to view details of your order.</p>
                    			<asp:Button ID="Button5" runat="server" Text="Place Order" class="continue top" 
                                                onclick="Button3_Click" />
                            </div>
                        </div>
                        
                    </div>
                  </div>
                    
                    
              </div>
                <!-- End of Login Box	-->        
                
                <!-- Right Shopping Cart	-->
                <div class="shop-cart">
                	<h3>Shipping Address</h3>
                    <p style="color:#999; padding:0 0 0 10px; line-height:18px;">
                       
                        <asp:Literal ID="Label5" runat="server"></asp:Literal>
                        </p>
                       
                </div>
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->
        
</asp:Content>

