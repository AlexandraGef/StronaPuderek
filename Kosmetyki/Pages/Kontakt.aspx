<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kontakt.aspx.cs" Inherits="Pages_Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <asp:Panel ID="pnlProducts" runat="server">
         <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Contact-Us.png" Width="1059px" />
    </asp:Panel>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" BackColor="#F79BFB" BorderColor="#F79BFB" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="#660066" Width="351px" BorderStyle="None" Font-Names="Viner Hand ITC" style="margin-left: 0px" ReadOnly="True">                Zadzwoń do Nas</asp:TextBox>

    <br />
    <br />
    <asp:Image ID="Image2" runat="server" Height="24px"  ImageUrl="~/Images/pinktel.png" Width="35px" style="margin-left: 183px" />
    <asp:TextBox ID="TextBox3" runat="server" BackColor="#F79BFB" BorderColor="#F79BFB" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#9F009F" Width="351px" BorderStyle="None" Font-Names="Viner Hand ITC" style="margin-left: 3px" ReadOnly="True">Nr.kom:     500299345</asp:TextBox>

    <br />

    <br />
    <asp:TextBox ID="TextBox1" runat="server" BackColor="#F79BFB" BorderColor="#F79BFB" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="#660066" Width="346px" BorderStyle="None" Font-Names="Viner Hand ITC" style="margin-left: 0px" ReadOnly="True">          Wyślij do Nas e-mail </asp:TextBox>

    
    
    <br />
    <br />
    <br />

    <table border = "0" style="width: 409px; margin-left: 334px;">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Imię*" Font-Names="Garamond"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" ValidationGroup = "contact" CssClass="inputs" Font-Names="Garamond" Font-Size="Medium"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
             ControlToValidate = "txtName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Temat*" Font-Names="Garamond"></asp:Label><br />
        </td>
        <td>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="inputs" Font-Names="Garamond" Font-Size="Medium"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
             ControlToValidate = "txtSubject"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Email*" Font-Names="Garamond"></asp:Label><br />
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="inputs" Font-Names="Garamond" Font-Size="Medium"></asp:TextBox><br />
            <asp:RegularExpressionValidator id="valRegEx" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression=".*@.*\..*"
            ErrorMessage="*Niepoprawny adres e-mail."
            display="dynamic" Font-Names="Garamond"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate = "txtEmail"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:Label ID="Label4" runat="server" Text="Treść zapytania*" Font-Names="Garamond"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode = "MultiLine" CssClass="inputs" Font-Names="Garamond" Font-Size="Medium" ></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
            ControlToValidate = "txtBody"></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td></td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="inputs" Font-Names="Garamond" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            &nbsp;<asp:Button ID="btnSend" runat="server" Text="Wyślij" OnClick="btnSend_Click" CssClass="button" ForeColor="#FFCCFF" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Label ID="lblMessage" runat="server" ForeColor = "Green" Font-Names="Garamond"></asp:Label>
       </td>
    </tr>
</table>
</asp:Content>

