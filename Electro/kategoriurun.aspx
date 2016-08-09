<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kategoriurun.aspx.cs" Inherits="Electro.kategoriurun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  RepeatColumns="3" runat="server">
       <div class="center_title_bar">Kategoriler</div>
     <asp:Repeater ID="rptKategorilerUrun"  runat="server" OnItemCommand="rptKategorilerUrun_ItemCommand">

          <ItemTemplate>
        
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box"> 
                     
                  <div class="product_title"><a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'>
                        <asp:Label ID="lblModel" runat="server" Text='<%# string.Format("{0}", Eval("Model")) %>'></asp:Label></a></div>
                 <div class="product_img"><a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'>
                     
                     <asp:Image ID="Image1" CssClass="urunDetayResim" ImageUrl='<%# string.Format("images/urunler/{0}", Eval("Resim")) %>' runat="server" /></div>
                    <%-- <img src='<%# string.Format("images/urunler/{0}", Eval("Resim")) %>' alt="" title="" border="0"  /></a></div>--%>
                 <div class="prod_price"><span class="price"><asp:Label ID="lblFiyat" runat="server" Text='<%# string.Format("{0:N}", Eval("Fiyat")) %>'></asp:Label></span></div>                        
         
                    </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
              <asp:ImageButton ID="btnSepeteAt" CssClass="prod_detay2" runat="server"  CommandArgument='<%# Eval("Id") %>' CommandName="sepeteAt" ImageUrl="~/images/cart.gif" />
                   <asp:ImageButton ID="btnDetay" CssClass="prod_detay2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="DetayaGit" ImageUrl="~/images/btn_detay2.png"/>      
            </div>                     
        </div>
       
    </ItemTemplate>
    </asp:Repeater>
</asp:Content>
