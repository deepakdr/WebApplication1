<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WithoutAjaxDemo.aspx.cs" Inherits="WebApplication1.WithoutAjaxDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>

            <asp:Label ID="lblDateTime" Text="Nothing" runat="server"></asp:Label>
            <asp:Button OnClientClick="DisableControls()" OnClick="btnSubmit_Click" ID="btnSubmit" Text="Update Time" runat="server" />

            <br />
            <asp:TextBox ID="txtDemo" runat="server"></asp:TextBox>
            <br />
            <asp:DropDownList runat="server" ID="ddlFrom">
                <asp:ListItem Value="MAS">Chennai Central</asp:ListItem>
                <asp:ListItem Value="MS">Chennai Egmore</asp:ListItem>
                <asp:ListItem Value="SBC">Bangalore JN</asp:ListItem>
                <asp:ListItem Value="WGL">Warangle</asp:ListItem>

            </asp:DropDownList>

            <br />


        </div>
    </form>
</body>
</html>
