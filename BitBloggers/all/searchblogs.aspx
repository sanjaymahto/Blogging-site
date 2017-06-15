<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
 
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindData();
    }

    private void BindData()
    {
        string cond = " 1 = 1 ";

        if (txtTitle.Text.Length > 0)
            cond += " and title like '%" + txtTitle.Text + "%'";

        if (txtAuthor.Text.Length > 0)
            cond += " and fname like '%" + txtAuthor.Text + "%'";

        if (txtFromDate.Text.Length > 0)
            cond += " and postedon >='" + txtFromDate.Text + "'";

        if (txtToDate.Text.Length > 0)
            cond += " and postedon <='" + txtToDate.Text + "'";

        // get data from database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select u.uid, bid,title,fname,postedon from users u, blogs b where u.uid = b.uid and " + cond, con);
        DataSet ds = new DataSet();
        da.Fill(ds, "blogs");

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Search Blogs</title>
</head>
<body>
    <form id="form1" runat="server" 
    style="font-family: 'Times New Roman', Times, serif; font-size: large">
    <div style="font-family: 'Times New Roman', Times, serif; font-size: large; background-color: #383838">
        <h2 style="font-family: 'Times New Roman', Times, serif; font-size: xx-large; color: #29A529">
            Search Blogs</h2>
        <table>
            <tr>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #28A428;">
                    Title :</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="255px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #28A428;">
                    Author Name :
                </td>
                <td style="height: 18px">
                    <asp:TextBox ID="txtAuthor" runat="server" Width="254px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #28A428;">
                    From Date :
                </td>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #28A428">
                    <asp:TextBox ID="txtFromDate" runat="server" Width="138px"></asp:TextBox>
                    (MM/DD/YY)&nbsp; To Date :
                    <asp:TextBox ID="txtToDate" runat="server" Width="135px"></asp:TextBox>
                    (MM/DD/YY)</td>
            </tr>
        </table>
    
    </div>
        <br />
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" 
        Text="Search" BackColor="Black" Font-Bold="True" 
        Font-Names="Adobe Caslon Pro Bold" Font-Size="Large" ForeColor="#009900" 
        Height="33px" Width="108px" /> &nbsp; &nbsp; 
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" Cellpadding="5" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="showblog.aspx?bid={0}"
                    DataTextField="title" HeaderText="Title" />
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="showuser.aspx?uid={0}"
                    DataTextField="fname" HeaderText="Author" />
                <asp:BoundField DataField="postedon" HeaderText="Posted On" />
            </Columns>
            <HeaderStyle BackColor="#404040" ForeColor="White" />
        </asp:GridView>
    <br />
    <br />
    <a href="../login.aspx">Go Back</a>
        </form>
</body>
</html>
