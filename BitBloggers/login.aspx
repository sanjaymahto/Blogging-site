<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);   //to make sql connections
        try
        {
            con.Open(); //to open sql connection
            SqlCommand cmd = new SqlCommand("select uid, fname from users where email = @email and pwd = @pwd", con); //command to get data from table
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = txtPwd.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) // valid user
            {
                Session.Add("uid", dr["uid"]);
                Session.Add("fname", dr["fname"]);
                FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
                txtEmail.Text = "";
                
            }
            else
                lblMsg.Text = "Invalid Login!";
            txtEmail.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            txtEmail.Text = "";
        }
    }

    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    Server.Transfer("~/all/register.aspx", true);
    //}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>BitBloggers</title>
    <!--Title-->
    <link rel="Shortcut Icon" href="photos/bichat_logo.png" />
    <style type="text/css">
        .style1
        {
            width: 100px;
            height: 82px;
        }
        .style2
        {
            top: auto;
            height: auto;
            right: auto;
            bottom: auto;
            left: auto;
            width: 927px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="background-color: #000000; color: #FFFFFF;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img alt="Sorry! Image can't be displayed" class="style1" 
                src="photos/KdLWr22l.jpeg" 
                
                style="position: absolute; list-style-position: outside; top: 3px; left: 17px; vertical-align: top;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Bit" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="XX-Large" ForeColor="#EABB00" 
                Height="45px" Width="22px"></asp:Label>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2"
                runat="server" Text="Bloggers" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="XX-Large" ForeColor="#FFFFB3" 
                Height="45px" Width="123px"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                Font-Names="Times New Roman" Font-Size="X-Large" ForeColor="#E6B800" 
                Text="New User ?" ToolTip="Register Yourself."></asp:Label>
&nbsp;<asp:Image ID="Image2" runat="server" Height="37px" ImageAlign="Top" 
                ImageUrl="~/photos/REGISTER_NOW-BUTTON.png" Width="153px" />
        &nbsp;<a href="all/register.aspx" 
                        
                style="font-family: 'Century Gothic'; font-size: x-large; font-weight: bold; color: #FF860D">Click Here</a>
        </div>
        <table width="100%" height="600px">
            <tr>
                <td valign="top" 
                    style="background-color: #000000; color: #FFFFA4; vertical-align: top;" 
                    class="style2">
                    <h2>
                        &nbsp;</h2>
                    <h2 style="background-color: #F99500; color: #FFFF95;">
                        &nbsp;What is Blog?<br />
                    </h2>
                    A blog (a truncation of the expression weblog) is a discussion or informational site published on the World Wide Web consisting of discrete entries ("posts") typically displayed in reverse chronological order (the most recent post appears first). Until 2009, blogs were usually the work of a single individual, occasionally of a small group, and often covered a single subject. More recently, "multi-author blogs" (MABs) have developed, with posts written by large numbers of authors and professionally edited. MABs from newspapers, other media outlets, universities, think tanks, advocacy groups, and similar institutions account for an increasing quantity of blog traffic. The rise of Twitter and other "microblogging" systems helps integrate MABs and single-author blogs into societal newstreams. Blog can also be used as a verb, meaning to maintain or add content to a blog.<br />
                    <br />
                    <h2 style="background-color: #F99500; color: #FFFF95;">
                        &nbsp;Want to Join?<br />
                    </h2>
                    <ul>
                        <li>Register as a user for free</li>
                        <li>Start posting your blogs.</li>
                    </ul>
                    <h2 style="background-color: #F99500; color: #FFFF95;">
                        Recently Posted Blogs</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bid,uid"
                        DataSourceID="SqlDataSource1" Width="99%" AllowPaging="True" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="bid" HeaderText="bid" ReadOnly="True" SortExpression="bid"
                                Visible="False" />
                            <asp:BoundField DataField="uid" HeaderText="uid" ReadOnly="True" SortExpression="uid"
                                Visible="False" />
                            <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="all/showblog.aspx?bid={0}"
                                DataTextField="title" HeaderText="Title" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                            <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="all/showuser.aspx?uid={0}"
                                DataTextField="fname" HeaderText="Author" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="postedon" HeaderText="Posted on" ReadOnly="True" 
                                SortExpression="postedon" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="select  top 5 bid, u.uid,title, fname, postedon = convert( varchar(10), postedon, 3) from blogs b, users u&#13;&#10;where  b.uid = u.uid order by bid desc">
                    </asp:SqlDataSource>
                    
                    <asp:Image ID="Image1" runat="server" Height="52px" ImageAlign="Middle" 
                        ImageUrl="~/photos/search-circular-symbol_318-50644.jpg" Width="55px" />
                    <a href="all/searchblogs.aspx" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold; color: #FF860D">Search Blogs</a><br />
                    <br />
&nbsp;</td>
                <td valign="top" 
                    style="background-color:#F5DEB3; font-family: 'Times New Roman', Times, serif; color: #F46200; font-size: medium;" 
                    width="100px">
                    <h3>
                        &nbsp;
                        Login</h3>
                    Email Address<br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Email is required!" ControlToValidate="txtEmail" 
                        ClientIDMode="Static"></asp:RequiredFieldValidator><br />
                    Password<br />
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Password is required!" ControlToValidate="txtPwd" 
                        ClientIDMode="Static"></asp:RequiredFieldValidator><br />
                    &nbsp;
                    <br />
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" 
                        BackColor="#353535" Font-Bold="True" Font-Names="Adobe Caslon Pro Bold" 
                        Font-Size="Large" ForeColor="#DFDF00" Height="27px" Width="97px" /><br />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <a href="all/forgotpassword.aspx" 
                        style="color: #E15A00; font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: bold">Forgot Password?</a> 
                    <br />
                    
                    <br />
                    Advertisements :<br />
                    <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="Add" />
                    <asp:XmlDataSource ID="Add" runat="server" DataFile="~/XMLFile.xml">
                    </asp:XmlDataSource>
                    
                </td>
            </tr>
        </table>
    
    </div>
    </form>
    <div style="background-color: #000000; font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; padding: inherit; margin: inherit; color: #D6D6D6;  text-align: center; top: 721px; left: 0px; width: 1351px; height: 55px;">
       &copy; Copyright:- BitBloggers.com<br />
        &nbsp;Created by:- Sanjay kumar</div>
</body>
</html>
