<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminAnasayfa.Master" AutoEventWireup="true" CodeBehind="markalar.aspx.cs" Inherits="Electro.Admin.markalar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td colspan="2">
                <asp:DropDownList ID="ddlMarkalar" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMarkalar_SelectedIndexChanged" ></asp:DropDownList>

                <asp:Label ID="lblMaId" runat="server"></asp:Label>

            </td>
            <td>
                <asp:Label ID="lblMarAciklama" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtMarka" runat="server" Width="144px"></asp:TextBox>

            </td>
            <td>
        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Marka adı boş !" ControlToValidate="txtMarka" CssClass="hata" ></asp:RequiredFieldValidator></td>

        </tr>
        <tr>
            <td colspan="2">

                <asp:LinkButton ID="lbtnKaydet" runat="server" OnClick="lbtnKaydet_Click">Kaydet</asp:LinkButton>|<asp:LinkButton ID="lbtnGuncelle" runat="server" OnClick="lbtnGuncelle_Click">Güncelle</asp:LinkButton>|<asp:LinkButton ID="lbtnSil" runat="server" OnClientClick="javascript:return confirm('Silmek istediğinize emin misiniz?');" OnClick="lbtnSil_Click">Sil</asp:LinkButton>
            </td>

        </tr>

    </table>
</asp:Content>
