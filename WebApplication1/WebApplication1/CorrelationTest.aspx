<%@ Page Title="" Language="C#" MasterPageFile="~/Bootstrap.Master" AutoEventWireup="true" CodeBehind="CorrelationTest.aspx.cs" Inherits="Edit.WebForm1" %>
<%@ Register assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <form id="form2" runat="server" method="post">
        <div class="span10">
            <div class="page-header">
                <h3>Correlation Test</h3>
            </div>
            <div class="container">

                        <asp:Label ID="Label1" runat="server" Text="Compare:"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <asp:Label ID="Label2" runat="server" Text="with:"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <br /><br />
          &nbsp;<asp:Button ID="Button1" runat="server"
            Text="Submit" class="btn btn-primary btn-large" onclick="Button1_Click" />
            </div>

        </div>
      
    </form>

</asp:Content>
