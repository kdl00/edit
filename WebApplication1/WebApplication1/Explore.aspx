<%@ Page Title="Create a new report" Language="C#" MasterPageFile="~/Bootstrap.Master"
    AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="Edit.Explore" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
    <title>Explore Your Data</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <form id="form1" runat="server">
    <div class="span10" id="container">
        <div class="page-header">
            <h3>
                Explore Your Data</h3>
        </div>
        <p>
            The table below allows you to manipulate data. You can dissect a large amount of
            student information and place only the data you need into a compact and summarized
            visual report.</p>
        <p>
            You can begin by browsing through the student information elements in the <strong>Filter
                Area</strong> below. When you find the student information element you wish
            to include in your report <strong>click and drag the student information element</strong>
            into <strong>Column Area</strong>, <strong>Row Area</strong> or <strong>Data Area</strong>.<br /><br />
        </p>
            <br />
        <div style="overflow: auto;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:editConnectionString %>"
            SelectCommand="SELECT * FROM [datawarehouse]"></asp:SqlDataSource>
            <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
            DataSourceID="SqlDataSource1" Width="100%" EnableCallBacks="False">
                <Fields>
                    <dx:PivotGridField ID="fieldTeacherID" FieldName="TeacherID" AreaIndex="0" 
                        Caption="Teacher ID">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldSchoolCode" FieldName="SchoolCode" AreaIndex="1" 
                        Caption="School Code">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldGrade" FieldName="Grade" AreaIndex="2" 
                        Caption="Grade Level">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnSpellingTest0to28" FieldName="ScoreOnSpellingTest(0to28)"
                        AreaIndex="3" Caption="Score On Spelling Test">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnSummary" FieldName="ScoreOnSummary" 
                        AreaIndex="4" Caption="Score On Summary">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnWriting" FieldName="ScoreOnWriting" 
                        AreaIndex="5" Caption="Score On Writing">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldBOYBBReadingScore" FieldName="BOY_BB-ReadingScore" 
                        AreaIndex="6" Caption="Beginning of Year Reading Score">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYMathLevel" FieldName="EOYMathLevel"
                        AreaIndex="7" Caption="End of Year Math Level">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYScienceLevel" FieldName="EOYScienceLevel" 
                        AreaIndex="8" Caption="End of Year Science Level">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYReadingScore" FieldName="EOY-ReadingScore"
                        AreaIndex="9" Caption="End of Year Reading Score">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYCOmpositeScore" FieldName="EOY-COmpositeScore"
                        AreaIndex="10" Caption="End of Year Composite Score">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYPSSAScore" FieldName="EOY-PSSA-Score"
                        AreaIndex="11" Caption="End of Year PSSA Score">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYProblemSolvingScore" 
                        FieldName="EOY-Problem-SolvingScore" AreaIndex="12" 
                        Caption="End of Year Problem Solving Score">
                    </dx:PivotGridField>
                </Fields>
                <OptionsView ShowFilterHeaders="False"></OptionsView>
            </dx:ASPxPivotGrid>
        </div>
        
        <dx:ASPxPivotCustomizationControl ID="ASPxPivotCustomizationControl1" runat="server"
            Height="606px" Width="698px" ASPxPivotGridID="ASPxPivotGrid1" Layout="BottomPanelOnly2by2">
        </dx:ASPxPivotCustomizationControl>
    </div>
    </form>
</asp:Content>
