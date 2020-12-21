<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="TheElectronicCommerce.userControl.menu" %>
<table style="width :778px; height :104px;　font-size: 9pt; font-family: 宋体; vertical-align :top; background-color:#f1eded "  border="0" cellpadding="0" cellspacing="0">
    <tr valign =top >
    <td  align =left style="width: 778px; height: 93px; "  valign =top><br />
     <p align="right" style="background-color:#f0e4ce">
     <a href="#" style=" color:#5c3f2a; font-size: 9pt; font-family: 宋体;  text-decoration :none;">联系客服</a> 
    |<a href="#" style=" color:#5c3f2a; font-size: 9pt; font-family: 宋体;  text-decoration :none;">设置主页</a>
    |<a href="#" style="color:#5c3f2a; font-size: 9pt; font-family: 宋体;  text-decoration :none;">收藏本站</a>&nbsp;&nbsp;
        </p>
    <P align=right style="background-color:black">
    <a href="shopCart.aspx" style=" color:white; font-size: 9pt; font-family: 宋体;  text-decoration :none;">购物车</font></a>
    |<a href="buyFlow.aspx" style=" color:white; font-size: 9pt; font-family: 宋体;  text-decoration :none;">购物流程</a>
    |<asp:LinkButton ID="lnkbtnOut" runat="server" Font-Underline=false ForeColor="White" OnClick="lnkbtnOut_Click" CausesValidation="False" >退出登录</asp:LinkButton>&nbsp;&nbsp;
    </p>
   
        <p align="center">
        
            &nbsp; &nbsp; &nbsp;<asp:Label ID="labDate"
                runat="server" Text="Label"></asp:Label> &nbsp; &nbsp;&nbsp; 
           
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" Font-Underline="False" >首页</asp:HyperLink>
            <font color="black">|&nbsp; </font>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/goodsList.aspx?var=1&&id=1 " Font-Underline="False" >新品上市</asp:HyperLink>
            <font color="black">|&nbsp; </font>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/goodsList.aspx?id=2&&var=1" Font-Underline="False">精品推荐</asp:HyperLink>
            <font color="black">|&nbsp; </font>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/goodsList.aspx?id=3&&var=1" Font-Underline="False">特价商品</asp:HyperLink>
            <font color="black">|&nbsp; </font>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/goodsList.aspx?id=4&&var=1" Font-Underline="False">热销商品</asp:HyperLink>
        </td> 
     </tr> 
     </table>