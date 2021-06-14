<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="IBUSMedicalv2.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var reportID = document.getElementById('<%=SearchReportID.ClientID%>').value;
            if (reportID.length <= 0) {
                alert('Please enter a valid report number!');
                return false;
            }
            if (reportID.search("'") >= 0 || reportID.search("--") >= 0) {
                alert('Please enter a valid report number!');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    IBUS::Patient Reports
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
    <li><a href="Home.aspx">Home</a></li>
    <li><a href="UserLogin.aspx">Appointments</a></li>
    <li class="active"><a href="#">Patient Reports</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form runat="server">
            <div class="row">
                <div class="col-md-4 col-xs-4 col-md-offset-4 col-xs-offset-4">
                    <div class="form-group">
                        <label for="reportID">Report ID:</label>
                        <asp:TextBox ID="SearchReportID" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Button runat="server" class="btn btn-default" Text="Submit" OnClick="loadReport" OnClientClick="javascript: return validation();" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-xs-6 col-md-offset-3 col-xs-offset-3">
                    <br>
                    <span id="htmlReplaceReport" runat="server"></span>
                </div>
            </div>
        </form>
    </div>
</asp:Content>

