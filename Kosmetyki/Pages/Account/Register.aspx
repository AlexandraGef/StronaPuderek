<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Acount_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <p>
        <asp:Literal ID="litStatus" runat="server"></asp:Literal>
    </p>
    <p>
        Nazwa Użytkownika: </p>
    <p>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserName" ErrorMessage="Pole Nazwa Użytkownika jest wymagane" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Hasło: </p>
    <p>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword" ErrorMessage="Podaj hasło" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Potwierdź hasło:
    </p>
    <p>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Powtórz hasło" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Imię:</p>
    <p>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Pole imię jest wymagane" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Nazwisko:</p>
    <p>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Pole nazwisko jest wymagane" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Adres:</p>
    <p>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="Pole adres jest wymagane" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Kod pocztowy:</p>
    <p>
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Pole kod pocztowy jest wymagane" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Zarejestruj" ForeColor="#FFCCFF" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

