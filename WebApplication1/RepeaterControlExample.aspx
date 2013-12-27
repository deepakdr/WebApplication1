<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepeaterControlExample.aspx.cs" Inherits="WebApplication1.RepeaterControlExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlDS"></asp:Repeater>
        <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDB %>" DeleteCommand="DELETE FROM [Employees] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Employees] ([FirstName], [LastName], [Age], [Sex]) VALUES (@FirstName, @LastName, @Age, @Sex)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [FirstName] = @FirstName, [LastName] = @LastName, [Age] = @Age, [Sex] = @Sex WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="Sex" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="Sex" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
