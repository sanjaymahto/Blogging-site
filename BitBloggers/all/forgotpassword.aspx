<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Net.Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select pwd from users where email = @email", con);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            Object pwd = cmd.ExecuteScalar();
            if ( pwd == null ) {
                lblMsg.Text = "Sorry! Invalid Email Account";
                return;
            }
            // send mail
            //MailMessage msg = new MailMessage();
            //msg.To.Add( new MailAddress(txtEmail.Text));
            //msg.From = new MailAddress("admin@classroom.com");
            //msg.Subject = "Password Recovery";
            //msg.IsBodyHtml = true;
            //msg.Body = "Dear User, <p/>Use following password to login.<p/>Password :  " + pwd.ToString() + "<p/>Webmaster<br/>yourblogs.com";
            //SmtpClient server  = new SmtpClient("localhost");
            //server.Send(msg);
            lblMsg.Text = "Your password is " + pwd + ". Use it for Login.";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2 align="center" style="background-color: #2E2E2E; color: #CACA00">
            :Password Recovery:</h2>
        <p>
            Enter your email address :
            <asp:TextBox ID="txtEmail" runat="server" Width="241px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                Display="Dynamic" ErrorMessage="Please enter your email." 
                ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" 
                Text="Submit" BackColor="#3E3E3E" BorderStyle="Outset" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="X-Large" ForeColor="#2EB82E" 
                Height="36px" Width="114px" />
        </p>
        <p>
            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro" Font-Size="Large" ForeColor="#F96400"></asp:Label>&nbsp;</p>
        <p style="color: #FD6500; font-family: 'Times New Roman', Times, serif; font-size: large">
            <a href="../login.aspx" shape="default">Go Back</a></p>
        <p>
            &nbsp;</p>
    
    </div>
    </form>
</body>
</html>
