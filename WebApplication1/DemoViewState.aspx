<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoViewState.aspx.cs" Inherits="WebApplication1.DemoViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtDemo" runat="server"/>       
         <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Button" />
        <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Demo ViewState" />
    </div>
    </form>
</body>
</html>
