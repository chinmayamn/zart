<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="new_arrivals"  Codebehind="new-arrivals.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
    .mains
    {
    	padding-left:12px; float:left;
    }
.ratingEmpty
{
background: url(images/star.png) no-repeat -11px 0px ;
width:11px;
height:11px;margin-top:0px;
}
.ratingFilled
{
background: url(images/star.png) no-repeat 0px 0px;
width:11px;
height:11px; 
margin-top:0px;
}
.ratingSaved
{
background: url(images/star.png) no-repeat;
width:16px;
height:14px;
}
</style>

 	<!-- Content	-->
        <div class="content">
            <!-- Pros	-->
            <div class="pros">
            	
                <ul class="navi">
                  
                     
                     <li><a href=index.aspx>Home</a></li>
                	<li><a href="#" >New - Arrivals</a> </li>
                	  
                  </ul>	
                
                
                <div class="price-left">
                	
                    <!-- Categories Left Nav	-->
                    <div class="nav-tree">
                    	<h4>Categories</h4>
                        <div class="nav-cont cates">
                        	
                            <h1><a id="acat" runat="server">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                
                                
                                </a></h1>
                            
                            <ul class="cate-list">
                            
                            
                            
                                <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" DataKeyField="id">
                                 <ItemTemplate>
                                 <li><a href=products.aspx?sid=<%#Eval("id")%>><%#Eval("category") %></a>
                                	<ul class="cate-list">
                                    
                                    
                                        <asp:DataList ID="DataList2" runat="server">
                                        
                                        <ItemTemplate>
                                         <li><a href=products.aspx?ssid=<%#Eval("id") %>><%#Eval("Category") %> ( <%#Eval("counts") %> )</a></li>
                                        </ItemTemplate>
                                        </asp:DataList>
<%--                                       (<%#Eval("counts")%>)--%>
                                    </ul>
                                </li>
                                 </ItemTemplate>
                                </asp:DataList>
                            	
                            	
                            	
                            	
                            	
                            </ul>
                            
                        </div>
                    </div>
                    <!-- End of Categories Left Nav	-->
                    
                         
                </div>
                
                <div class="homepro-list">
                	
                    <div class="pro-heading">
                    	<h1 class="pro-hline">
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            
                            
                            </h1>
                       
                    </div>
                    
                    <div class="p-new">
                    
                    
                        <asp:Repeater ID="Repeater1" runat="server" onitemcommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                        <div class="pro-new">
                        	<h2><a href=product-details.aspx?id=<%#Eval("id")%>><%#Eval("pname") %></a> </h2>
                            <em><%#Eval("discount") %> %<br />Off</em>
                            <div class="proimg">
                            	<a href=product-details.aspx?id=<%#Eval("id")%>><img src=<%#Eval("image") %> alt="" id="i1" runat="server"/></a>
                            </div>
                            
                            
                            <div class="pro-dets">
                               
                                <asp:Literal ID="Literal3" runat="server"  Text=<%#Eval("stext")%> ></asp:Literal>
                            </div>
                            
                            <div class="prices">
                            	<p><del>Rs.<%#Eval("mrp") %></del>	<br />	
                                Rs.<%#Eval("actual") %></p>
                                
                               
                                  <asp:LinkButton ID="LinkButton2" runat="server" class="add-cart" CommandName="add" CommandArgument=<%#Eval("id")%>>Add to Cart</asp:LinkButton>
                          
                                <div class="stars">
                                	
                                    <cc1:Rating ID="Rating1" runat="server" CssClass="mains" ReadOnly="true" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled"   CurrentRating='<%# Convert.ToInt16( Eval("rating")) %>'>
                                    </cc1:Rating>
                                 
                                 
                                                     </div>
                                
                            </div>
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    	
                    	
               
                    
                    </div>
                        
                    </div>
                    
                </div>
                
            </div>
            <!-- End of Pros	-->
            
            
            
            
      
        <!-- ENd of content	-->
</asp:Content>

