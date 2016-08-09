<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sepetim.aspx.cs" Inherits="Electro.sepetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvSepetim" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="115px" Width="580px" ShowFooter="True" OnRowDeleting="gvSepetim_RowDeleting"  OnSelectedIndexChanged="gvSepetim_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Urun Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UrunId") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnOdemeYap" runat="server" OnClick="btnOdemeYap_Click" Text="Ödeme Yap" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UrunId") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="Model" HeaderText="Model" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Detayı" HeaderText="Detay" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Adet" HeaderText="Adet" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Tutar" HeaderText="Toplam" >
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:CommandField DeleteImageUrl="~/images/1461789657_fileclose.ico" DeleteText="SİL" ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:Panel ID="pnlOdeme" runat="server" Visible="False">
     <table style="margin-top:20px;"><tr><td><span>Banka Seçiniz :</span><asp:DropDownList ID="ddlBankaSeciniz" runat="server" Height="16px" Width="120px">
         <asp:ListItem>Akbank</asp:ListItem>
         <asp:ListItem>Garanti</asp:ListItem>
         <asp:ListItem>Teb</asp:ListItem>
         <asp:ListItem>Ziraat</asp:ListItem>
         </asp:DropDownList></td> <td><span>&nbsp;&nbsp; Taksit Sayısı&nbsp;&nbsp;&nbsp; :</span><asp:DropDownList ID="ddlTaksitSayisi" runat="server" Height="16px" Width="36px">
             <asp:ListItem>1</asp:ListItem>
             <asp:ListItem>2</asp:ListItem>
             <asp:ListItem>3</asp:ListItem>
             <asp:ListItem>4</asp:ListItem>
             </asp:DropDownList></td></tr>
        <tr><td colspan="2"><span>Kart No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</span><asp:TextBox ID="txtKartNo" runat="server" Height="24px" Width="240px" TextMode="Number"></asp:TextBox></td></tr>
      <tr><td><span>Cvc No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </span><asp:TextBox ID="txtCvcNo" runat="server" Height="16px" TextMode="Number" Width="47px"></asp:TextBox></td><td style="text-align:right">
               <asp:Button ID="btnBitir" runat="server" Text="ÖDE" Height="24px" OnClick="btnBitir_Click" Width="84px" /></td></tr>
           
           </table>
      
      </asp:Panel>

</asp:Content>
