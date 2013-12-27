<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleDGV.aspx.cs" Inherits="WebApplication1.SampleDGV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">

        function SayHello() {
            alert('Hi');
        }


        function ReadDisplay() {
            alert(document.getElementById('lblSomething').innerText);
        }
    </script>
</head>
<body onload="SayHello()">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblSomething" runat="server" Text="Hello World" />
        <button value="Click Me" onclick="ReadDisplay()">Click Me</button>
    <asp:DataGrid ID="grdSample" runat="server" ></asp:DataGrid>
    </div>
    </form>
</body>
</html>
