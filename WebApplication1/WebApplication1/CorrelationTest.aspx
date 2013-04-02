<%@ Page Title="" Language="C#" MasterPageFile="~/Bootstrap.Master" AutoEventWireup="true"
    CodeBehind="CorrelationTest.aspx.cs" Inherits="Edit.WebForm1" %>

<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
    <title>Correlation Test</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <form id="form2" runat="server" method="post">
    <div class="span10">
        <div class="page-header">
            <h3>
                Correlation Test</h3>
        </div>
        <p>
            It is important to understand how student information elements may impact each other.
            These associations among elements of student information may be used to predict
            future outcomes of student success.</p>
        <p>
            Please select two student information elements to compare. A correlation test between
            these two elements will be performed to find associativity.</p>
        <div class="container">
            <asp:Label ID="Label1" runat="server" Text="Compare:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="with:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <br />
            <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Height="282px" 
                Width="776px">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                <seriestemplate>
                    <viewserializable>
                        <cc1:PointSeriesView>
                        </cc1:PointSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel LineVisible="True">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <cc1:PointOptions>
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:PointSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </seriestemplate>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
            </dxchartsui:WebChartControl>
            <br />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary btn-large"
                OnClick="Button1_Click" />
        </div>
    </div>
    </form>
</asp:Content>
