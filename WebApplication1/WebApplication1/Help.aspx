<%@ Page Title="" Language="C#" MasterPageFile="~/Bootstrap.Master" AutoEventWireup="true"
    CodeBehind="Help.aspx.cs" Inherits="Edit.Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
    <title>Help</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="span10">
        <div class="page-header">
            <h3>
                Help</h3>
        </div>
        <div class="container">
            <h4>
                What would you like with?</h4>
            <ul class="helplst">
                <li><a href="#Explore Your Data">Explore Your Data</a></li>
                <li><a href="#Correlation Test">Correlation Test</a></li>
            </ul>
            <br />
            <br />
            <br />
            <h4 id="Explore Your Data">
                Explore Your Data</h4>
            <p>
                This page allows you to manipulate student information elements and include them
                in a summarized report. For example, one may wish to see which teachers have the
                best performing students in terms of PSSA scores. In this example you may click
                and drag the information element <strong>Teacher ID</strong> into the <strong>Rows Area</strong>
                box and click and drag <strong>PSSAScore</strong> into the <strong>Data Area</strong>
                box. As you manipulate information elements by clicking and drag them into either
                the Filter Area, Column Area, Row Area or Data Area the information table will update
                to reflect your changes. If <strong>Defer Layout Update</strong> is checked updates
                to the information table will be postponed until you manually press the <strong>Update
                    button</strong>. You may use defer layout updates if a substantial amount of
                information elements are being manipulated.</p>
            <p>
                Below is a short video tutorial to help you get started:</p>
            <img alt="videoplayer" src="videoplayer.jpg" />
            <br />
            <br />
            <h4 id="Correlation Test">
                Correlation Test</h4>
            <p>
                This page allows you to find correlations between two different student information
                elements. A correlation test may prove useful in exploring how student information
                elements impact each other and effect student success outcomes. A correlation is
                a measure of associativity between datasets not a measure of causality.</p>
            <p>
                Below is a short video tutorial to help you get started:</p>
            <img alt="videoplayer" src="videoplayer.jpg" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
