<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="Electro.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="center_content">
      <div class="center_title_bar">İletişim</div>
      <div class="prod_box_big">
        <div class="top_prod_box_big"></div>
        <div class="center_prod_box_big">
          <div class="contact_form">
            <div class="form_row">
                <label class="contact"><strong>Ad Soyad:</strong></label>
                <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="contact_input"></asp:TextBox>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Email:</strong></label>
             <asp:TextBox ID="txtEmail" runat="server" CssClass="contact_input"></asp:TextBox>
            </div>
            <div class="form_row">
             <label class="contact"><strong>Telefon:</strong></label>
             <asp:TextBox ID="txtTelefon" runat="server" CssClass="contact_input"></asp:TextBox>
            </div>
            <div class="form_row">
             <label class="contact"><strong>Mesaj:</strong></label>
             <asp:TextBox ID="txtMesaj" runat="server" CssClass="contact_textarea" Height="53px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form_row"> <a href="#" ><asp:Button ID="btnGonder" class="contact" runat="server" BackColor="White" OnClick="btnGonder_Click" Text="Gönder" /></a></div>
          </div>
        </div>
        <div class="bottom_prod_box_big"></div>
      </div>
    </div>
    
   
</asp:Content>
