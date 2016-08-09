<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminAnasayfa.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="Electro.Admin.urunler" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <span style="float: left; width: 75px; display: block;">Marka</span>:
        <asp:DropDownList ID="ddlMarkalar" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMarkalar_SelectedIndexChanged"></asp:DropDownList><br />
            <span style="float: left; width: 75px; display: block;">Kategori</span>:
        <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged"></asp:DropDownList><br />

            <span style="float: left; width: 75px; display: block;">Urun Ara</span>:
            <asp:TextBox ID="txtUrunAra" runat="server"></asp:TextBox>

            <asp:LinkButton ID="lblUrunAra" runat="server">Ara</asp:LinkButton><br /><br />
            <asp:GridView ID="dgvUrunler" runat="server" AutoGenerateColumns="False" >
                <Columns>
                    <asp:TemplateField HeaderText="Marka">
                        <ItemTemplate><%# Eval("Markalar.Ad") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Model">
                        <ItemTemplate><%# Eval("Model") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Fiyat">
                        <ItemTemplate><span class="yazisagda"><%# string.Format("{0:#,#.00}TL", Eval("Fiyat")) %></span></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href='<%# string.Format("urundetay.aspx?urunId={0}",Eval("Id"))%>'>Detay</a></ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
  </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
