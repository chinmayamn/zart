<%@ Control Language="C#" AutoEventWireup="true" Inherits="menu" Codebehind="menu.ascx.cs" %>
          <!-- Menus	-->
        <div class="menus">
        	<div class="all-cat">
            	<div class="cats">All Categories</div>
                
                <div class="categories">
                  <asp:DataList ID="Repeater23" runat="server" DataKeyField="id" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <ItemTemplate>
                
                
                		<div class="cat-list"><a href=products.aspx?cid=<%#Eval("id")%>> <%#Eval("category") %></a> 
                    	<div class="sub-catlist">
                        	
                        	   <asp:DataList ID="Repeater2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataKeyField="id">
                            <ItemTemplate>
                       	<div class="column">
                                <b> 
                                
                                <a href=products.aspx?sid=<%#Eval("id")%> style="text-decoration:none"><%#Eval("category") %> </a>
                               
                                
                                
                                </b>
                               <asp:DataList ID="Repeater5" runat="server">
                               <ItemTemplate>
                               
                                 <a href=products.aspx?ssid=<%#Eval("id") %>><%#Eval("category") %></a>	
                               </ItemTemplate>
                               </asp:DataList>
                               		  
                               		  
                             	
                            </div>
                                 
                                   </ItemTemplate>
                            </asp:DataList>
                                	  
                         
                            
                        </div>
                    </div>
                	
                	
                	
                	
                	  </ItemTemplate>
                    </asp:DataList>
                	
                	
                    
                    
                    
                    
                    
                    
                </div>
            	
            	
            	
            	
            </div>   
    <ul class="cat-menus">
        <asp:DataList ID="Repeater3" runat="server" DataKeyField="id" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <ItemTemplate>
          <li><a href=products.aspx?cid=<%#Eval("id")%> ><%#Eval("category") %></a>
                	<div class="sub-catlist">
                	   <asp:DataList ID="Repeater4" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataKeyField="id">
                            <ItemTemplate>
                	
                        
                        	<div class="column">
                                <b> <a href=products.aspx?sid=<%#Eval("id")%> style="text-decoration:none"><%#Eval("category") %></a></b>
                                <asp:DataList ID="Repeater6" runat="server">
                                
                                <ItemTemplate>
                                 <a href=products.aspx?ssid=<%#Eval("id")%>><%#Eval("category") %></a>	
                                </ItemTemplate>
                                </asp:DataList>
                              
                               
                                                    </div>
                                </ItemTemplate>
                                </asp:DataList>
                                
              
                        </div>
                </li>
       
        </ItemTemplate>
        </asp:DataList>
              
             
          </ul>
            
            <a href="#" class="feedback">Feed Back</a>
            
            
        </div>
        <!-- End of Menus	-->
        
        