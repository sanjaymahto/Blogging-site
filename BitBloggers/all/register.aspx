<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("storedprocedure4", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // SqlConnection con = new SqlConnection(Database.ConnectionString);
           // cmd.Parameters.AddWithValue("email", TextBox3.Text);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = TextBox3.Text;
           // cmd.Parameters.AddWithValue("Pwd", TextBox4.Text);
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = TextBox4.Text;
           // cmd.Parameters.AddWithValue("Fname", TextBox1.Text);
            cmd.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = TextBox1.Text;
           // cmd.Parameters.AddWithValue("lname", TextBox2.Text);
            cmd.Parameters.Add("@lname", SqlDbType.VarChar, 50).Value = TextBox2.Text;
           // cmd.Parameters.AddWithValue("location", TextBox6.Text);
            cmd.Parameters.Add("@location", SqlDbType.VarChar, 50).Value = TextBox6.Text;
           // cmd.Parameters.AddWithValue("occupation", TextBox7.Text);
            cmd.Parameters.Add("@occupation", SqlDbType.VarChar, 200).Value = TextBox7.Text;
          //  cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = txtEmail.Text;
            cmd.Parameters.Add("@photo", SqlDbType.Char, 1).Value = 'y';
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i>0)
                Label11.Text = "user is registered successfully!";
            else
                Label11.Text = "Sorry! User not Registered!";
        }
        catch (Exception ex)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            Label11.Text = "Error -> " + ex.Message;
        }
        finally
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            con.Close();
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        Label11.Text = "please fill the above credentials in order to register";
         
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Registration page</title>
</head>
<body style="background-color: #000000; height: 822px;">
    <form id="form1" runat="server">
    <div>
    <div style="background-color: #000000; color: #FFFFFF; font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img alt="Sorry! Image can't be displayed" class="style1" 
                src="../photos/KdLWr22l.jpeg" 
                
                
                
                style="position: absolute; list-style-position: outside; top: 3px; left: 17px; vertical-align: top; width: 126px; height: 111px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Bit" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="XX-Large" ForeColor="#EABB00" 
                Height="32px" Width="22px"></asp:Label>&nbsp;&nbsp;&nbsp; 
            <asp:Label ID="Label2"
                runat="server" Text="Bloggers" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="XX-Large" ForeColor="#FFFFB3" 
                Height="32px" Width="123px"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="../login.aspx">Go Back</a>
    </div>

    </div>
    <div>
    <h2 style="font-family: 'Times New Roman', Times, serif; font-size: xx-large; font-weight: bold; font-style: normal; color: #BFBF00; text-align: center; word-spacing: normal; letter-spacing: normal; background-color: #000000; background-image: none; background-repeat: no-repeat; border-top-color: #FFFFFF; border-top-width: thin; border-top-style: outset;">&nbsp;Registration form</h2>
        </div>
    <div style="background-color: #1E1E1E; font-family: 'Times New Roman', Times, serif; font-size: x-large; color: #D95700; height: 705px; text-align: center;">
        &nbsp;&nbsp;
        Please Enter the Following Details:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        <div style="height: 650px">
            <asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="284px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" Display="Dynamic" 
                ErrorMessage="First Name is Required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Last Name"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="26px" Width="283px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" Display="Dynamic" 
                ErrorMessage="Last name is required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Email ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="283px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" Display="Dynamic" 
                ErrorMessage="Email ID is Required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="282px" 
                TextMode="Password"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" Display="Dynamic" 
                ErrorMessage="Password is required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Height="27px" Width="208px" 
                TextMode="Password"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" Display="Dynamic" 
                ErrorMessage="comfirm password required"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox4" ControlToValidate="TextBox5" Display="Dynamic" 
                ErrorMessage="password does not match"></asp:CompareValidator>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Location"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Height="27px" Width="285px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="TextBox6" Display="Dynamic" 
                ErrorMessage="Location is required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Occupation"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="279px" Rows="4" 
                TextMode="MultiLine"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="TextBox7" Display="Dynamic" 
                ErrorMessage="Location is required"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="upload your photo"></asp:Label>
&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="221px" />
            <asp:Label ID="Label12" runat="server" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br />
            <br />
            Field Marked with * are Mandatory.<br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" BackColor="Black" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="X-Large" ForeColor="#009900" 
                Height="34px" onclick="Button1_Click" Text="Submit" Width="140px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" BackColor="Black" Font-Bold="True" 
                Font-Names="Adobe Caslon Pro Bold" Font-Size="X-Large" ForeColor="#009900" 
                Height="33px" Text="Cancel" Width="143px" onclick="Button2_Click" />
            <br />
            <asp:Label ID="Label11" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
    </div>
    </form>
    <div style="background-color: #000000; font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; padding: inherit; margin: inherit; color: #D6D6D6;  text-align: center; top: 721px; left: 0px; width: 1351px; height: 55px;">
        © Copyright:- BitBloggers.com<br />
        &nbsp;Created by:- Sanjay kumar</div>
</body>
</html>
