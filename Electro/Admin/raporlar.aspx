<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminAnasayfa.Master" AutoEventWireup="true" CodeBehind="raporlar.aspx.cs" Inherits="Electro.Admin.raporlar" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

   

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><header style="background-color:aqua;">
     <asp:LinkButton ID="LinkButton1" runat="server" Width="400px" OnClick="LinkButton1_Click">Satış Raporları</asp:LinkButton><asp:Label ID="Label1" runat="server" Text="Arama Yap  : " Visible="False"></asp:Label><asp:TextBox ID="txtSatıiAra" runat="server" OnTextChanged="txtSatıiAra_TextChanged" Visible="False"></asp:TextBox><span> </span><asp:Button ID="btnSatisArama" runat="server" Text="Ara" OnClick="btnSatisArama_Click" Visible="False" /></header>
     <asp:Panel ID="pnlSatislar" runat="server"> 
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="SatisNo,id" DataSourceID="SqlDataSource3" Visible="False" Width="750px" AllowPaging="True" AllowSorting="True" Height="224px">
             <Columns>
                 <asp:BoundField DataField="SatisNo" HeaderText="SatisNo" InsertVisible="False" ReadOnly="True" SortExpression="SatisNo" />
                 <asp:BoundField DataField="Musteri" HeaderText="Musteri" SortExpression="Musteri" ReadOnly="True" />
                 <asp:BoundField DataField="SiparisTarih" HeaderText="SiparisTarih" SortExpression="SiparisTarih" />
                 <asp:BoundField DataField="TeslimTarihi" HeaderText="TeslimTarihi" SortExpression="TeslimTarihi" />
                 <asp:BoundField DataField="Tutar" HeaderText="Tutar" SortExpression="Tutar" />
                 <asp:BoundField DataField="Miktar" HeaderText="Miktar" SortExpression="Miktar" />
                 <asp:BoundField DataField="Durumu" HeaderText="Durumu" SortExpression="Durumu" />
                 <asp:BoundField DataField="OdemeId" HeaderText="OdemeId" SortExpression="OdemeId" />
                 <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:electronixConnectionString4 %>" SelectCommand="SELECT s.SatisNo, k.Ad + ' ' + k.Soyad AS Musteri, s.SiparisTarih, s.TeslimTarihi, s.Tutar, s.Miktar, s.Durumu, s.OdemeId, k.id, s.KullaniciNo FROM Satislar AS s INNER JOIN Kullanicilar AS k ON s.KullaniciNo = k.id WHERE (s.Silindi = @Silindi)">
             <SelectParameters>
                 <asp:Parameter DefaultValue="False" Name="Silindi" Type="Boolean" />
             </SelectParameters>
         </asp:SqlDataSource>
   </asp:Panel>
 </div>  
     <div><header style="background-color:aqua;">
     <asp:LinkButton ID="LinkButton2" runat="server" Width="400px" OnClick="LinkButton2_Click">Rezervasyonlar</asp:LinkButton><asp:Label ID="Label2" runat="server" Text="Arama Yap  : " Visible="False"></asp:Label><asp:TextBox ID="txtUrunAra" runat="server" Visible="False"></asp:TextBox><asp:Button ID="btnModelAra" runat="server" Text="Ara" OnClick="btnModelAra_Click" Visible="False" /></header>
     <asp:Panel ID="Panel1" runat="server">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id,Expr2" DataSourceID="SqlDataSource2" Visible="False" Width="750px" AllowPaging="True" AllowSorting="True">
             <Columns>
                 <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                 <asp:BoundField DataField="SatisNo" HeaderText="SatisNo" SortExpression="SatisNo" />
                 <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                 <asp:BoundField DataField="Adet" HeaderText="Adet" SortExpression="Adet" />
                 <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" SortExpression="Fiyat" />
                 <asp:BoundField DataField="Tutar" HeaderText="Tutar" SortExpression="Tutar" />
                 <asp:CheckBoxField DataField="Satildi" HeaderText="Satildi" SortExpression="Satildi" />
                 <asp:BoundField DataField="Detay" HeaderText="Detay" SortExpression="Detay" />
             </Columns>
         </asp:GridView>
         
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:electronixConnectionString3 %>" SelectCommand="SELECT s.id, s.SatisNo, u.Model, s.Adet, s.Fiyat, s.Tutar, s.Satildi, s.Detay, s.Model AS Expr1, u.Id AS Expr2 FROM SepeteEklenen AS s INNER JOIN Urunler AS u ON s.UrunId = u.Id">
         </asp:SqlDataSource>
    </asp:Panel>
 </div>  
</asp:Content>
