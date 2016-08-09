<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="urundetay.aspx.cs" Inherits="Electro.urundetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rpUrunler" runat="server" OnItemCommand="rpUrunler_ItemCommand">
    <ItemTemplate>
    	<div class="center_title_bar"><%# string.Format("{0}", Eval("Kategoriler.Ad")) %></div>
    
    	<div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 <a href="" title=""><img src='<%# string.Format("images/urunler/{0}", Eval("Resim")) %>' class="urunDetayResim" alt='<%# string.Format("{0} {1}", Eval("Markalar.Ad"), Eval("Model")) %>' title='<%# string.Format("{0} {1}", Eval("Markalar.Ad"), Eval("Model")) %>' border="0" /></a>
                
                 </div>
                     <div class="details_big_box">
                       
                         <div class="specifications"><br />
                         <span style="color:#847676;"> Marka:</span><span class="blue"><asp:Label ID="lblMarka" runat="server" Text='<%# Eval("Markalar.Ad") %>'></asp:Label> </span><br />

                            <span  style="color:#847676;"> Model:</span> <span class="blue">
            <asp:Label ID="lblModel" runat="server" Text='<%# Eval("Model")%>'></asp:Label></span><br />
                            
                           <span  style="color:#847676;"> Detay:</span> <span class="blue">
                <asp:Label ID='lblDetay' runat="server" Text='<%# Eval("Detay") %>'></asp:Label></span><br />
                          
                         </div>
                         <div class="prod_price_big"><span  style="color:#847676;">
                    <asp:Label ID="lblFiyat" runat="server" Text='<%# string.Format("{0:N}" ,Eval("Fiyat"))%>'></asp:Label></span></div>
                         
                   <span><asp:ImageButton ID="btnSepet" CssClass="addtocart" runat="server"  CommandArgument='<%# Eval("Id") %>' CommandName="sepeteAt" ImageUrl="~/images/cart.gif"/>  Sepete At</span>  
         
                     </div>                        
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>
    
    </ItemTemplate>
   </asp:Repeater>
</asp:Content>
