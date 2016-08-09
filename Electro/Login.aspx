<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Electro.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 178px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server"> <asp:Login ID="Login1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8"
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="0.8em" ForeColor="#333333" Height="78px" LoginButtonText="Giriş yap"
        Orientation="Horizontal" PasswordLabelText="Şifre:"
        PasswordRequiredErrorMessage="Şifre gerekli." RememberMeText="Beni hatırla."
        TextLayout="TextOnTop" TitleText="Üye Girişi"
        UserNameLabelText="Kullanıcı adı:"
        UserNameRequiredErrorMessage="Kullanıcı adı gerekli." Width="575px">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:78px;width:575px;">
                            <tr>
                                <td align="center" colspan="4" style="color:White;background-color:#1C5E55;font-size:0.9em;font-weight:bold;">Üye Girişi</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Kullanıcı adı:</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Şifre:</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" ValidationGroup="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Kullanıcı adı gerekli." ToolTip="Kullanıcı adı gerekli." ValidationGroup="1">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" ValidationGroup="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Şifre gerekli." ToolTip="Şifre gerekli." ValidationGroup="1">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Beni hatırla." />
                                </td>
                                <td align="right">
                                    <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"  Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" Text="Giriş yap" ValidationGroup="1" OnClick="LoginButton_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                                 <td align="right" colspan="2">
                                    <asp:Button ID="BtnUyeOL" runat="server" BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" Text="Uye OL"  OnClick="BtnUyeOL_Click" ValidationGroup="2" />
                                </td>
                            </tr>
                           
                               
                          
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" />
    </asp:Login></asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False" BorderColor="#33CCCC" BackColor="#33CCCC">
         <center>
              <table style="width:300px; background-color:white;">
                          <tr><td colspan="2" >Üye Kayıt İşlemleri</td></tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblAd" runat="server">Ad :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired2" runat="server" ControlToValidate="txtAd" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblSoyad" runat="server">Soyad :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtSoyad" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtSoyad" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" >Tc No :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtTcNo" runat="server" TextMode="Number" MaxLength="11"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="txtTcNo" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" >E-mail:</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" >Adres :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtAdres" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="txtAdres" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" >Telefon :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtTelefon" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="txtTelefon" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td align="right">
                                    <asp:Label ID="Label1" runat="server" >Şifre :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSifre" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td align="right">
                                    <asp:Label ID="Label2" runat="server">Şifre Tekrar :</asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtSifreTekrar" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSifreTekrar" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifreTekrar" ErrorMessage="CompareValidator">*</asp:CompareValidator>
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
                  <asp:Button ID="btnUyeKayit" runat="server" Text="Uye Olunuz" OnClick="btnUyeKayit_Click" /></td></tr>
                        </table>
             </center>
    </asp:Panel>
</asp:Content>
