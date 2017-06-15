<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Author page</title>
    <style type="text/css">
        .style2
        {
            width: 475px;
        }
    </style>
</head>
<body>
<h2>User Profile</h2>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            Width="100%" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
            BorderWidth="2px" CellPadding="3" CellSpacing="1">
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemTemplate>
            <table width="100%">
            <tr>
           <td class="style2">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img height ="200" src='../photos/<%# Eval("uid")%>.jpg' style="width: 320px; height: 250px;" alt="~/photos/Photo.jpg" />
           </td>
          <td>
            <table cellpadding="5" border="1"> 
            <tr>
             <td style="font-weight:700">First Name </td> 
             <td><%#Eval("fname") %></td> 
            </tr> 
           <tr>
             <td style="font-weight:700">Last Name </td> 
             <td><%#Eval("lname") %></td> 
            </tr>  
           <tr>
             <td style="font-weight:700"> Email Address</td> 
             <td><%#Eval("email") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700"> Location</td> 
             <td><%#Eval("location") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700">Occupation</td> 
             <td><%#Eval("occupation") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700">Joined On</td> 
             <td><%#Eval("dj") %></td> 
            </tr>  
           </table> 
          </td> 
            </tr> 
            </table>
            </ItemTemplate>
            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:FormView>
     <p style="color: #FD6500; font-family: 'Times New Roman', Times, serif; font-size: large" />
     <a href="../login.aspx">Go Back</a>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT uid,[email], [occupation], [fname], [lname], [dj], [location] FROM [users] WHERE ([uid] = @uid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
