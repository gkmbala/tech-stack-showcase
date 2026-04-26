<%@ Page Language="C#" AutoEventWireup="true"
   CodeBehind="Dashboard.aspx.cs" Inherits="MyApp.Dashboard" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sales Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblTitle" runat="server" Text="Dashboard" />
        <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Month" HeaderText="Month" />
                <asp:BoundField DataField="Revenue" HeaderText="Revenue" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Units" HeaderText="Units Sold" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh"
            OnClick="btnRefresh_Click" />
    </form>
</body>
</html>
