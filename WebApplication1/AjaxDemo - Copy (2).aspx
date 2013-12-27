<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDemo.aspx.cs" Inherits="WebApplication1.AjaxDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>

    <form id="form1" runat="server" style="font-family: verdana, Geneva, Tahoma, sans-serif; font-size: small">
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

            <asp:UpdatePanel ID="upPanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>

                    <asp:Panel runat="server" GroupingText="This is Update Panel 3">
                        <asp:Label ID="lblUP3" runat="server" Text="Nothing">


                        </asp:Label>


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

        var msgDiv = document.getElementById('_asyncCallsMadeDiv');
        var msgProgressDiv = document.getElementById('msgProgressDiv');
        var progressDiv = document.getElementById('progressDiv');
        //init Request
        Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(initRequestHandler);

        //begin Request
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequestHandler);

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoading(pageLoadingRequestHandler);

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedRequestHandler);

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);



        Sys.Application.add_init(function () {

            //var msgDiv = document.getElementById('_asyncCallsMadeDiv');
            msgDiv.innerHTML += " AsyncPostBack Issued.<br/>";


        });


        function initRequestHandler(sender, args) {
            //msgDiv.innerHTML += " Init Request Handler Called.<br/>";

            var prm = Sys.WebForms.PageRequestManager.getInstance();


            if (prm.get_isInAsyncPostBack() & args.get_postBackElement().id == "btnCancel") {
                prm.abortPostBack();
            }
            else if (prm.get_isInAsyncPostBack() & args.get_postBackElement().id=="btnSubmitUP1") {
                args.set_cancel(true);
                msgProgressDiv.innerHTML = "Previous Call is in progress..";


            }


            if (!prm.get_isInAsyncPostBack() & args.get_postBackElement().id == "btnSubmitUP1") {
                progressDiv.style.visibility = "visible";
                msgProgressDiv.innerHTML = "Please Wait. Retriving Data..";

            }

            //}


        }

        function beginRequestHandler(sender, args) {
            msgDiv.innerHTML += " Begin Request Handler Called.<br/>";
        }


        function pageLoadingRequestHandler(sender, args) {
            msgDiv.innerHTML += " Page Loading Called.<br/>";
        }


        function pageLoadedRequestHandler(sender, args) {
            msgDiv.innerHTML += " Page Loaded Called.<br/>";
        }


        function endRequestHandler(sender, args) {
            msgDiv.innerHTML += " End Request Called.<br/>";

            progressDiv.style.visibility = "hidden";
        }



        function onInitRequest(sender, args) {


            msgDiv.innerHTML += " AsyncPostBack Issued.<br/>";

        }


        function DisableControls() {
            //document.getElementById('txtDemo').disabled = true;
        }





    </script>
</body>
</html>
