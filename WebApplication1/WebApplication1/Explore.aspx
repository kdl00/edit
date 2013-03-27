<%@ Page Title="Create a new report" Language="C#" MasterPageFile="~/Bootstrap.Master"
    AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="Edit.Explore" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <form id="form1" runat="server">
    <div class="span10">
        <div class="page-header">
            <h3>
                Explore your data</h3>
        </div>
       
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1"
            OptionsView-ShowFilterHeaders="False" OptionsView-ShowHorizontalScrollBar="true" Height="100px" Width="100%">
           
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
                <dx:PivotGridField ID="fieldTotalReadingLessonsonBlackBoard" FieldName="TotalReadingLessonsonBlackBoard"
                    AreaIndex="6">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBBReadingScore" FieldName="BB-ReadingScore" AreaIndex="7">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalReadingLessonsonBlackBoard1" FieldName="TotalReadingLessonsonBlackBoard1"
                    AreaIndex="8">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBBReadingScore1" FieldName="BB-ReadingScore1" AreaIndex="9">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandWeeksUsed" FieldName="Study-IslandWeeksUsed"
                    AreaIndex="10">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandDaysUsed" FieldName="StudyIsland-DaysUsed"
                    AreaIndex="11">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandMinutedUsed" FieldName="StudyIslandMinutedUsed"
                    AreaIndex="12">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandAvgWeek" FieldName="StudyIslandAvgWeek" AreaIndex="13">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandQuestions" FieldName="StudyIslandQuestions"
                    AreaIndex="14">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandReadingQuestions" FieldName="StudyIslandReadingQuestions"
                    AreaIndex="15">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandMathQuestions" FieldName="StudyIslandMathQuestions"
                    AreaIndex="16">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandAppliedQuestions" FieldName="StudyIslandAppliedQuestions"
                    AreaIndex="17">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandProbSolv" FieldName="StudyIslandProbSolv"
                    AreaIndex="18">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandAttempts" FieldName="StudyIsland-Attempts"
                    AreaIndex="19">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStudyIslandBlankAnswers" FieldName="StudyIslandBlankAnswers"
                    AreaIndex="20">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYMathLevel" FieldName="EOYMathLevel" AreaIndex="21">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYScienceLevel" FieldName="EOYScienceLevel" AreaIndex="22">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYReadingScore" FieldName="EOY-ReadingScore" AreaIndex="23">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYCOmpositeScore" FieldName="EOY-COmpositeScore" AreaIndex="24">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYPSSAScore" FieldName="EOY-PSSA-Score" AreaIndex="25">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEOYProblemSolvingScore" FieldName="EOY-Problem-SolvingScore"
                    AreaIndex="26">
                </dx:PivotGridField>
            </Fields>
          
        </dx:ASPxPivotGrid>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:editConnectionString %>"
            SelectCommand="SELECT * FROM [datawarehouse]"></asp:SqlDataSource>
        <dx:ASPxPivotCustomizationControl ID="ASPxPivotCustomizationControl1" runat="server"
            Height="606px" Width="698px" ASPxPivotGridID="ASPxPivotGrid1">
        </dx:ASPxPivotCustomizationControl>
     </div>
    </form>
</asp:Content>
