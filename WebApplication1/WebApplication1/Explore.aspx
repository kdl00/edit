<%@ Page Title="Create a new report" Language="C#" MasterPageFile="~/Bootstrap.Master"
    AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="Edit.Explore" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
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
            into <strong>Column Area</strong>, <strong>Row Area</strong> or <strong>Data Area</strong>.</p>
        <br />
        <div style="overflow: auto;">
            <br />
            <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1"
                OptionsView-ShowFilterHeaders="False" Width="100%">
                <Fields>
                    <dx:PivotGridField ID="fieldTeacherID" FieldName="TeacherID" AreaIndex="0">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldSchoolCode" FieldName="SchoolCode" AreaIndex="1">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldGrade" FieldName="Grade" AreaIndex="2">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnSpellingTest0to28" FieldName="ScoreOnSpellingTest(0to28)"
                        AreaIndex="3">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnSummary" FieldName="ScoreOnSummary" AreaIndex="4">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldScoreOnWriting" FieldName="ScoreOnWriting" AreaIndex="5">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldBOYBBReadingScore" FieldName="BOY_BB-ReadingScore" AreaIndex="6">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYTotalReadingLessonsonBlackBoard" FieldName="EOY_TotalReadingLessonsonBlackBoard"
                        AreaIndex="7">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYBBReadingScore" FieldName="EOY_BB-ReadingScore" AreaIndex="8">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandWeeksUsed" FieldName="Study-IslandWeeksUsed"
                        AreaIndex="9">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandDaysUsed" FieldName="StudyIsland-DaysUsed"
                        AreaIndex="10">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandMinutedUsed" FieldName="StudyIslandMinutedUsed"
                        AreaIndex="11">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandAvgWeek" FieldName="StudyIslandAvgWeek" AreaIndex="12">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandQuestions" FieldName="StudyIslandQuestions"
                        AreaIndex="13">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandReadingQuestions" FieldName="StudyIslandReadingQuestions"
                        AreaIndex="14">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandMathQuestions" FieldName="StudyIslandMathQuestions"
                        AreaIndex="15">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandAppliedQuestions" FieldName="StudyIslandAppliedQuestions"
                        AreaIndex="16">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandProbSolv" FieldName="StudyIslandProbSolv"
                        AreaIndex="17">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandAttempts" FieldName="StudyIsland-Attempts"
                        AreaIndex="18">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldStudyIslandBlankAnswers" FieldName="StudyIslandBlankAnswers"
                        AreaIndex="19">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYMathLevel" FieldName="EOYMathLevel" AreaIndex="20">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYScienceLevel" FieldName="EOYScienceLevel" AreaIndex="21">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYReadingScore" FieldName="EOY-ReadingScore" AreaIndex="22">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYCOmpositeScore" FieldName="EOY-COmpositeScore" AreaIndex="23">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYPSSAScore" FieldName="EOY-PSSA-Score" AreaIndex="24">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEOYProblemSolvingScore" FieldName="EOY-Problem-SolvingScore"
                        AreaIndex="25">
                    </dx:PivotGridField>
                </Fields>
                <OptionsView ShowFilterHeaders="False"></OptionsView>
            </dx:ASPxPivotGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:editConnectionString %>"
            SelectCommand="SELECT * FROM [datawarehouse]"></asp:SqlDataSource>
        <dx:ASPxPivotCustomizationControl ID="ASPxPivotCustomizationControl1" runat="server"
            Height="606px" Width="698px" ASPxPivotGridID="ASPxPivotGrid1" Layout="BottomPanelOnly2by2">
        </dx:ASPxPivotCustomizationControl>
    </div>
    </form>
</asp:Content>
