<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Electro.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"   runat="server">

        <div class="center_title_bar">Yeni Ürünler</div>
  <asp:Repeater ID="rptYeniUrun"  runat="server" OnItemCommand="rptYeniUrun_ItemCommand">
      
        <ItemTemplate>

            <div class="prod_box">
                <div class="top_prod_box"></div>
                <div class="center_prod_box">

                    <div class="product_title"><a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'>
                        <asp:Label ID="lblModel" runat="server" Text='<%# string.Format("{0}", Eval("Model")) %>'></asp:Label></a></div>
                    <div class="product_img">
                        <a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'>

                            <asp:Image ID="Image1" CssClass="urunDetayResim" ImageUrl='<%# string.Format("images/urunler/{0}", Eval("Resim")) %>' runat="server" />
                    </div>
                  
                    <div class="prod_price"><span class="price">
                        <span><asp:Label ID="lblFiyat" runat="server" Text='<%# string.Format("{0:N}", Eval("Fiyat")) %>'></asp:Label></span></div>

                </div>
                <div class="bottom_prod_box"></div>
                <div class="prod_details_tab">
                
                 <asp:ImageButton ID="btnSepeteAt" CssClass="prod_detay2" runat="server"  CommandArgument='<%# Eval("Id") %>' CommandName="sepeteAt" ImageUrl="~/images/cart.gif" />
                   <asp:ImageButton ID="btnDetay" CssClass="prod_detay2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="DetayaGit" ImageUrl="~/images/btn_detay2.png"/>
                 <%--<a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>' class="prod_detay2">details</a> --%> 
                </div>

            </div>

        </ItemTemplate>
    </asp:Repeater>
     <div class="center_title_bar">Tavsiye Edilenler</div>
 
 <asp:Repeater ID="rpTavsiyeUrun" runat="server">

        <ItemTemplate>

            <div class="prod_box">
                <div class="top_prod_box"></div>
                <div class="center_prod_box">

                    <div class="product_title"><a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'><%# string.Format("{0}", Eval("Model")) %></a></div>
                    <div class="product_img">
                        <a href='<%# string.Format("urundetay.aspx?urunId={0}", Eval("Id")) %>'>

                            <asp:Image ID="Image1" CssClass="urunDetayResim" ImageUrl='<%# string.Format("images/urunler/{0}", Eval("Resim")) %>' runat="server" />
                    </div>
                  
                    <div class="prod_price"><span class="price"><%# string.Format("{0:#,#.00} TL", Eval("Fiyat")) %></span></div>

                </div>
                <div class="bottom_prod_box"></div>
                <div class="prod_details_tab">
               
                  
                 <asp:ImageButton ID="btnSepeteAt" CssClass="prod_detay2" runat="server"  CommandArgument='<%# Eval("Id") %>' CommandName="sepeteAt" ImageUrl="~/images/cart.gif" />
                   <asp:ImageButton ID="ImageButton1" CssClass="prod_detay2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="DetayaGit" ImageUrl="~/images/btn_detay2.png"/>
                </div>

            </div>

        </ItemTemplate>
    </asp:Repeater>
     
</asp:Content>
