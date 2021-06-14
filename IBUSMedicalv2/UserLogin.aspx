<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="IBUSMedicalv2.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
        function validation() {
            var inputCNIC = document.getElementById('<%=InputCNIC.ClientID%>').value;
            if (inputCNIC.length <= 0) {
                alert('Please enter a valid CNIC!');
                return false;
            }
            if (inputCNIC.search("'") >= 0 || inputCNIC.search("--") >= 0) {
                alert('Please enter a valid CNIC!');
                return false;
            }
            return true;
        }
        </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form runat="server">
            <div class="row">
                <div class="col-md-4 col-xs-4 col-md-offset-4 col-xs-offset-4">
                    <div class="form-group">
                        <label for="reportID">CNIC:</label>
                        <asp:TextBox ID="InputCNIC" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Button runat="server" class="btn btn-default" Text="Login" OnClick="AttemptLoginPerson" OnClientClick="javascript: return validation();" />
                    <a href="UserSignUp.aspx" class="btn btn-default" role="button">Sign Up</a>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
