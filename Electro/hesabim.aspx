<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hesabim.aspx.cs" Inherits="Electro.hesabim" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="center_title_bar">
        <asp:Button ID="Button1" runat="server" Text="Bilgileriniz" BackColor="Silver" BorderColor="White" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="15px" Font-Strikeout="False" Font-Underline="False" ForeColor="White" OnClick="Button1_Click1" /><asp:Button ID="Button2" runat="server" Text="Siparişleriniz" BackColor="Silver" BorderColor="White" Font-Bold="True" Font-Size="15px" ForeColor="White" OnClick="Button2_Click" />
    </div>

    <div class="prod_box_big">
        <div class="top_prod_box_big"></div>
        <div class="center_prod_box_big">

            <div>

                <div class="specifications">
                    <asp:Panel ID="Panel2" runat="server" Visible="False" >
         <center>
              <table style="width:300px; text-align:left;">
                          <tr><td colspan="2" style="text-align:center;" >Üye Kayıt İşlemleri</td></tr>
                            <tr>
                                <td style="width:80px;">
                                    <asp:Label ID="lblAd" runat="server">Ad :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired2" runat="server" ControlToValidate="txtAd" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSoyad" runat="server">Soyad :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSoyad" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtSoyad" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" >Tc No :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTcNo" runat="server" TextMode="Number" MaxLength="11"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="txtTcNo" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" >E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="QuestionLabel" runat="server" >Adres :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAdres" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="txtAdres" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="AnswerLabel" runat="server" >Telefon :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTelefon" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="txtTelefon" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                              <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" >Şifre :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSifre" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                  
                              <tr>
                                <td>
                                   <asp:Label ID="Label3" runat="server" >Yeni Şifre :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtYeniSifre" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                              <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server">Şifre Tekrar :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSifreTekrar" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtYeniSifre" ControlToValidate="txtSifreTekrar" ErrorMessage="CompareValidator">*</asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="lblMesaj" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
              <tr ><td colspan="2" align="center">
                  <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click" /></td></tr>
                        </table>
             </center>
    </asp:Panel>
                    <asp:Panel ID="Panel1" runat="server" Width="581px"><asp:GridView ID="gvSepetim" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="115px" Width="525px" ShowFooter="True" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" />
            <asp:BoundField DataField="UrunId" HeaderText="UrunId">
            <HeaderStyle Width="10px" />
            </asp:BoundField>
            <asp:BoundField DataField="SiparisTarih" HeaderText="SiparisTarihi" >
            <HeaderStyle HorizontalAlign="Left" Width="50px" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="TeslimTarihi" HeaderText="TeslimTarihi">
            <HeaderStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Detay" HeaderText="Detay" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Adet" HeaderText="Adet" >
            <HeaderStyle HorizontalAlign="Left" Width="10px" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Fiyat" HeaderText="Fiyat">
            <HeaderStyle Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="Tutar" HeaderText="Toplam" >
            <HeaderStyle HorizontalAlign="Right" Width="40px" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:CommandField SelectText="Detay" ShowSelectButton="True" />
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
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" EntityTypeName="">
                        </asp:LinqDataSource>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                        </asp:EntityDataSource>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
