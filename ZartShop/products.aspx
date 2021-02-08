<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="products"  Codebehind="products.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    
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
                    <asp:Repeater ID="Repeater3" runat="server">
                    
                     <ItemTemplate>
                     
                     <li><a href=index.aspx>Home</a></li>
                	<li><a href=products.aspx?cid=<%#Eval("id2")%>><%#Eval("category2") %></a> </li>
                	<li><a href=products.aspx?sid=<%#Eval("id1")%>><%#Eval("category1") %></a> </li>
                   	<li><a href=products.aspx?ssid=<%#Eval("id")%>><%#Eval("category") %></a>  </li>
                     </ItemTemplate>
                     
                     
                    </asp:Repeater>
                        <asp:Repeater ID="Repeater5" runat="server">
                    
                     <ItemTemplate>
                     
                     <li><a href=index.aspx>Home</a></li>
                	<li><a href=products.aspx?cid=<%#Eval("id")%>><%#Eval("category") %></a> </li>
               
                     </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="Repeater7" runat="server">
                    
                     <ItemTemplate>
                     
                     <li><a href=index.aspx>Home</a></li>
                
                     </ItemTemplate>
                    </asp:Repeater>
                    
                    
                      <asp:Repeater ID="Repeater9" runat="server">
                    
                     <ItemTemplate>
                     
                     <li><a href=index.aspx>Home</a></li>
                	<li><a href=products.aspx?cid=<%#Eval("id1")%>><%#Eval("category1") %></a> </li>
               <li><a href=products.aspx?sid=<%#Eval("id")%>><%#Eval("category") %></a> </li>
                     </ItemTemplate>
                    </asp:Repeater>
                    
                    
                	
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
                    
                    <div class="nav-tree" id="nav1" runat="server">
                    	<h4>Price</h4>
                        <div class="nav-cont price">
                        	<ul class="sel-price">
                        	
                               
                                <li><a href="#">Rs .100 - Rs.1499</a></li>
                            	<li><a href="#">Rs.1500 - Rs.2299</a></li>
                            	<li><a href="#">Rs.2300 - Rs.3499</a></li>
                            	<li><a href="#">Rs.3500 - Rs.9999</a></li>
                            	<li><a href="#">Rs.9999 - Rs.19999</a></li>
                            	<li><a href="#">Above 19999</a></li>
                              
                            	
                            </ul>
                        </div>
                    </div>
                    
                    <div class="nav-tree" id="nav2" runat="server">
                    	<h4>Brands</h4>
                        <div class="nav-cont price">
                        	<ul class="sel-price">
                        	<span style="float:right">
                        	
                        	
                                <asp:LinkButton ID="LinkButton3" Visible=false runat="server" onclick="LinkButton3_Click">Reset</asp:LinkButton>
                            </span>   
                            
                             <asp:Repeater ID="Repeater2" runat="server" 
                                    onitemcommand="Repeater2_ItemCommand">
                                <ItemTemplate>
                                
                                <li>
                                           
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text=<%#Eval("bname")%> CommandArgument=<%#Eval("id")%> CommandName="filter"></asp:LinkButton>
                                           
                                           </li>
                                </ItemTemplate>
                                </asp:Repeater>
                            	
                            	
                            	
                            	
                            </ul>
                        </div>
                    </div>
                    
                    
                </div>
                
                <div class="homepro-list">
                	
                    <div class="pro-heading">
                    	<h1 class="pro-hline">
                          
                            
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            
                            </h1>
                        <div class="view-type" id="viewtype" runat="server">
                            <b class="display">Display : </b>
                            <span class="view grid">Grid</span>
                            <span class="view list">List</span>
                        </div>
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
                             
                                <asp:Literal ID="Literal3" runat="server" Text=<%#Eval("stext")%>></asp:Literal>
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
                    	
                    	
                    	<asp:Repeater ID="Repeater4" runat="server">
                        <ItemTemplate>
                        <div class="pro-new">
                        	<h2><a href=products.aspx?sid=<%#Eval("id")%>><%#Eval("category") %></a> </h2>
                           
                            <div class="proimg">
                            	<a href=products.aspx?sid=<%#Eval("id")%>><img src=<%#Eval("image") %> alt="" id="i1" runat="server"/></a>
                            </div>
                            
                            
                          
                         
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    
                    
                    <asp:Repeater ID="Repeater6" runat="server">
                        <ItemTemplate>
                        <div class="pro-new">
                        	<h2><a href=products.aspx?cid=<%#Eval("id")%>><%#Eval("category") %></a> </h2>
                           
                            <div class="proimg">
                            	<a href=products.aspx?cid=<%#Eval("id")%>><img src=<%#Eval("image") %> alt="" id="i1" runat="server"/></a>
                            </div>
                            
                            
                          
                         
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Repeater ID="Repeater8" runat="server">
                        <ItemTemplate>
                        <div class="pro-new">
                        	<h2><a href=products.aspx?ssid=<%#Eval("id")%>><%#Eval("category") %></a> </h2>
                           
                            <div class="proimg">
                            	<a href=products.aspx?ssid=<%#Eval("id")%>><img src=<%#Eval("image") %>  alt="" id="i1" runat="server"/></a>
                            </div>
                            
                            
                          
                         
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                       <%-- <div class="shadow"></div>--%>
                    
                    </div>
                        
                    </div>
                    
                </div>
                
            </div>
            <!-- End of Pros	-->
            
            
            
            
      
        <!-- ENd of content	-->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

