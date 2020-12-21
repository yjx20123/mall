<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TheElectronicCommerce.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link  href="style/login.css" rel="stylesheet" type="text/css" />
</head>
<body >
    <div class="login-box">
  <h2>管理员登录</h2>
  <form id="from1" runat="server">
    <div class="user-box">
      <asp:TextBox ID="textName" runat="server" />
      <label>用户名</label>
    </div>
    <div class="user-box">
      <asp:TextBox ID="ttPassWord" runat="server" />
      <label>密码</label>
    </div>
      <div class="user-box">
      <asp:TextBox ID="ttword" runat="server" />
      <label>验证码</label>
          <br />
          <asp:Label ID="labCode" runat="server" BackColor="YellowGreen">8888</asp:Label>
    </div>
      
    <a href="#">&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server"  Text="登录" BackColor="#05070C" ForeColor="White" BorderStyle="None" BorderColor="#05070C" Width="46px"  OnClick="btnLogin_Click" />
       &nbsp; </a>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="#">&nbsp;&nbsp;<asp:Button ID="btnRegister" runat="server"  Text="取消" BackColor="#05070C" ForeColor="White" BorderStyle="None" BorderColor="#05070C" Width="46px" OnClick="btnCancel_Click"/>
        &nbsp;</a>
  </form>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
</div>
</body>
</html>
