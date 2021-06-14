<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="IBUSMedicalv2.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#<%= InputPersonDOB.ClientID %>").datepicker();
        });
        function validation() {
            var inputCNIC = document.getElementById('<%=InputPersonCNIC.ClientID%>').value;
            var inputName = document.getElementById('<%=InputPersonName.ClientID%>').value;
            var inputDOB = document.getElementById('<%=InputPersonDOB.ClientID%>').value;
            var inputPhoneNo = document.getElementById('<%=InputPersonPhoneNo.ClientID%>').value;
            var inputSex = document.getElementById('<%=InputPersonSex.ClientID%>').value;
            var inputs = inputCNIC + inputName + inputDOB + inputPhoneNo + inputSex;
            if (inputs.length <= 0) {
                alert('Please enter a valid credentials!');
                return false;
            }
            if (inputs.search("'") >= 0 || inputs.search("--") >= 0) {
                alert('Please enter a valid credentials!');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    Sign Up
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form runat="server">
            <div class="row">
                <div class="col-md-4 col-xs-4 col-md-offset-4 col-xs-offset-4">
                    <div>
                        <h3>Personal Details</h3>
                        <label for="PersonCNIC">CNIC:</label>
                        <asp:TextBox ID="InputPersonCNIC" runat="server" class="form-control"></asp:TextBox>

                        <label for="PersonName">Name:</label>
                        <asp:TextBox ID="InputPersonName" runat="server" class="form-control"></asp:TextBox>

                        <label for="PersonPhoneNo">Phone Number:</label>
                        <asp:TextBox ID="InputPersonPhoneNo" runat="server" class="form-control"></asp:TextBox>

                        <label for="PersonDOB">Date of Birth:</label>
                        <asp:TextBox ID="InputPersonDOB" runat="server" class="form-control"></asp:TextBox>

                        <label for="PersonSex">Sex:</label>
                        <asp:DropDownList ID="InputPersonSex" runat="server" class="btn btn-default btn-sm form-control">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button runat="server" class="btn btn-default" Text="Submit" OnClick="AttemptUserSignUp" OnClientClick="javascript: return validation();" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
