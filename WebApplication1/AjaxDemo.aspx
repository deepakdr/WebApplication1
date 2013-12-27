<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDemo.aspx.cs" Inherits="WebApplication1.AjaxDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="scMgrDemo" runat="server"></asp:ScriptManager>
        <div>
            <div id="progressDiv" style="border-style: solid; visibility: hidden; font-family: Verdana, Geneva, Tahoma, sans-serif; font-weight: bold; font-style: italic; color: #0066FF; font-size: small; background-color: #CCFFFF;">
                <table>
                    <tr>
                        <td>
                            <img src="images/ajax-loader2.gif" />

                        </td>
                        <td>
                            <div id="msgProgressDiv"></div>
                        </td>
                        <td>
                            <button id="btnCancel" value="cancel">Cancel</button></td>
                    </tr>
                </table>
            </div>

            <fieldset>
                <legend>Async Calls Made</legend>
                <div id="_asyncCallsMadeDiv"></div>

            </fieldset>
            <asp:UpdatePanel ID="upTimeUpdate" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:Panel runat="server" GroupingText="This is Update Panel - 1">
                        <asp:Label ID="lblDateTime" Text="Nothing" runat="server"></asp:Label>
                        <asp:Button ID="btnSubmitUP1" OnClientClick="DisableControls()" OnClick="submitClickUP1" Text="Update Time" runat="server" />
                    </asp:Panel>
                </ContentTemplate>

            </asp:UpdatePanel>
            <br />
            <asp:UpdatePanel ID="upPanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <asp:Panel runat="server" GroupingText="This is Update Panel 2">

                        <asp:TextBox ID="txtDemo" runat="server"></asp:TextBox>
                        <br />
                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlFrom_SelectedIndexChanged" runat="server" ID="ddlFrom">
                            <asp:ListItem Value="MAS">Chennai Central</asp:ListItem>
                            <asp:ListItem Value="MS">Chennai Egmore</asp:ListItem>
                            <asp:ListItem Value="SBC">Bangalore JN</asp:ListItem>
                            <asp:ListItem Value="WGL">Warangle</asp:ListItem>

                        </asp:DropDownList>

                        <br />
                        <asp:Button ID="btnSubmitUP2" runat="server" Text="Submit Data" OnClick="submitClickUP2" />
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel ID="upPanel3"  UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:Panel runat="server" GroupingText="This is Update Panel 3">
                        <asp:Label ID="lblUP3" runat="server" Text="Nothing"> </asp:Label>
                        <asp:Button ID="btnUP3" Text="Button UP3" runat="server" OnClick="btnUP3_Click" />
                        <asp:UpdatePanel ID="upNested4" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel1" runat="server" GroupingText="This is Nested Update Panel 4">
                                    <asp:Label ID="lblNestedUP4" runat="server"></asp:Label>
                                    <asp:Button ID="btnUPNested4" Text="Button UP4" runat="server" OnClick="btnUPNested4_Click" />
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSubmitUP1" />
                    <asp:AsyncPostBackTrigger ControlID="ddlFrom" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>

    <script type="text/javascript">

        function DisableControls() {
            //document.getElementById('txtDemo').disabled = true;
        }

        Sys.WebForms.PageRequestManager.getInstance();//this will get the instance of the
        //script manager

        var asyncMsgsDiv = document.getElementById('_asyncCallsMadeDiv');
        var progressDiv = document.getElementById('progressDiv');
        var msgProgressDiv = document.getElementById('msgProgressDiv');

        //Initializer Request
        Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(initRequestHandler);

        function initRequestHandler(sender, args) {

            asyncMsgsDiv.innerHTML += "Initalize Request Event </br>";

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            //if (!prm.get_isInAsyncPostBack() & args.get_postBackElement().id == "btnSubmitUP1") {
            //    progressDiv.style.visibility = 'visible';
            //    msgProgressDiv.innerHTML = "Please Wait. Retriving Data..";

            //}

            //this is to abort the post back
            if (prm.get_isInAsyncPostBack() & args.get_postBackElement().id == "btnCancel") {
                prm.abortPostBack();
            }

            progressDiv.style.visibility = 'visible';
            msgProgressDiv.innerHTML = "Please Wait. Retriving Data..";


        }

        //Begin Request
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequestHandler);

        function beginRequestHandler() {
            asyncMsgsDiv.innerHTML += "Begin Request Event </br>";
        }

        //Page Loading event 
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoading(pageLoadingHandler);

        function pageLoadingHandler() {

            asyncMsgsDiv.innerHTML += "Page Loading </br>";
        }


        //Page Loaded Event
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedHandler);

        function pageLoadedHandler() {

            asyncMsgsDiv.innerHTML += "Page Loaded </br>";
        }

        //End Request
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);

        function endRequestHandler() {

            asyncMsgsDiv.innerHTML += "End Request </br>";
            progressDiv.style.visibility = 'hidden';

        }
    </script>
</body>
</html>
