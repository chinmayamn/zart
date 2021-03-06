﻿<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="my_order"  Codebehind="my-order.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
   
<!-- Content	-->
        <div class="content">
        
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                    
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <h2>My Orders</h2>
                  <!-- Order Details	-->
                    <div class="order">
                    	
                        <!-- For Alternate Order details vary the 2nd class name "light" and "dark" for background change	-->
                      
                        <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                        <div class="order-details light">
                        	<h5><b>Order ID : </b> <%#Eval("id") %></h5>  <h6><b>Status : </b> <%#Eval("status") %></h6>
                            <div class="sep"></div>
                            <p><b>Date Added :</b> <%#Eval("date") %>	<br />  <b>Products :</b> <%#Eval("counts") %></p>

                            <p><b>Customer :</b> <%#Eval("name")%>	<br />  <b>Total :</b> Rs. <%#Eval("counts1") %></p>
                            <a href=my-order-details.aspx?id=<%#Eval("id")%> class="continue right">View</a>
                        </div>
                       
                        </ItemTemplate>
                        </asp:Repeater>
                        
                      
                    
                        
                        <!-- Results	-->
                        <div class="results">
                        
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Previous</asp:LinkButton>
                           
                            <asp:Literal ID="Literal2" runat="server" Visible=false></asp:Literal> 
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal> Items   Showing 
                            <asp:Literal ID="Literal3" runat="server"></asp:Literal> of (<asp:Literal ID="Literal4"
                                runat="server"></asp:Literal> Page )
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Next</asp:LinkButton>
                        
                        </div>
                        <!--End of Results	-->
                        <center> 
                        <asp:Label ID="Label1" runat="server" Text="No orders placed till now"></asp:Label></center>
                    </div>
                  	<!-- End of Order Detsils	-->
                    
                    
                    
                </div>
                <!-- End of Login Box	-->        
                
                <!-- Right Shopping Cart	-->
                <div class="shop-cart">
                	<h3>My Shopping Cart</h3>
                    <p style="color:#999; padding:0 0 0 10px; line-height:18px;">
                    
                        <asp:Label ID="Label2" runat="server" ></asp:Label>
								
								
								</p>
                       
                </div>
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->
         </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

