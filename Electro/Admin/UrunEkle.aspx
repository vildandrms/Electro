<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminAnasayfa.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="Electro.Admin.UrunEkle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="dialog_box.css" rel="stylesheet" />
    <script src="dialog_box.js"></script>
    <style type="text/css" >
td
{
    text-align:left;
    
    }
    
    tr:hover
    {
        background-color:transparent;
        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                Marka
            </td>
            <td>
                <asp:DropDownList ID="ddlMarka" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Kategori
            </td>
            <td>
                <asp:DropDownList ID="ddlKategori" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Model
            </td>
            <td>
                <asp:TextBox ID="txtModel" MaxLength="25" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtModel" Display="None" ErrorMessage="Model boş geçilmez !" CssClass="hata" ValidationGroup="yeniurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Fiyat
            </td>
            <td>
                <asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfv2" runat="server" ErrorMessage="Fiyat boş geçilemez !" CssClass="hata"
                    ValidationGroup="yeniurun" Display="None" ControlToValidate="txtFiyat"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtFiyat"
                    ValidationGroup="yeniurun" ErrorMessage="Geçersiz fiyat !" Display="None" MinimumValue="1"
                    MaximumValue="100000" Type="Currency" SetFocusOnError="True"></asp:RangeValidator>
            </td>
        </tr>
         <tr>
            <td>
                Adet
            </td>
            <td>
                <asp:TextBox ID="txtAdet" MaxLength="25" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtAdet" Display="None" ErrorMessage="Adet boş geçilmez !" CssClass="hata" ValidationGroup="yeniurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Detay
            </td>
            <td>
                
                <asp:TextBox ID="txtDetay" runat="server" Height="82px" Width="291px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Resim
            </td>
            <td>
                <asp:FileUpload ID="fuResim" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Yeni
            </td>
            <td>
                <asp:CheckBox ID="cbYeni" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Özel
            </td>
            <td>
                <asp:CheckBox ID="cbOzel" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Vitrin
            </td>
            <td>
                <asp:CheckBox ID="cbVitrin" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Tavsiye
            </td>
            <td>
                <asp:CheckBox ID="cbTavsiye" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="lbKaydet" ValidationGroup="yeniurun" runat="server" OnClick="lbKaydet_Click1">Kaydet</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
