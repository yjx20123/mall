<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigate.ascx.cs" Inherits="TheElectronicCommerce.userControl.navigate" %>

<style>
    .img-banner input {
        width: 80px;
        height: 100px;
    }

    .img-icon img {
        width: 50px;
        height: 50px;
    }
</style>
<table style="width: 204px; height: 448px; font-size: 9pt; font-family: 宋体; vertical-align: top; background-color: #f1eded" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="height: 35px"></td>
    </tr>
    <tr align="center" style="width: 204px; font-size: 9pt; font-family: 宋体; vertical-align: top;">
        <td>
            <asp:DataList ID="dlClass" runat="server" OnItemCommand="dlClass_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td align="left" style="width: 28px; height: 25px; vertical-align: bottom" class="img-icon">
                                <asp:Image ID="imageIcon" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"CategoryUrl")%>' />
                            </td>
                            <td></td>
                            <td align="left" style="width: 80px; height: 25px; font-size: 9pt; font-family: 宋体; vertical-align: bottom">
                                <asp:LinkButton ID="lnkbtnClass" runat="server" CommandName="select" CausesValidation="False" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ClassID") %>'><%# DataBinder.Eval(Container.DataItem, "ClassName") %></asp:LinkButton>
                            </td>
                        </tr>

                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<table style="width: 204px; height: 181px; font-size: 9pt; font-family: 宋体; vertical-align: top; text-align: center; background-image: url(images/新品上市.jpg); background-repeat: no-repeat" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="height: 31px; width: 204px;"></td>
    </tr>
    <tr>
        <td style="width: 204px;">
            <marquee direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="2" scrolldelay="7" style="width: 204px; height: 120px; font-size: 9pt; font-family: 宋体; vertical-align: top; text-align: center;">
          <asp:DataList ID="dlNewGoods" runat="server" OnItemCommand="dlNewGoods_ItemCommand" >   
            <ItemTemplate>
                <table  border="0" cellspacing="0" style="font-size :9pt" align =center >
                    <tr>
                        <td align="center" colspan="1" rowspan="5" class="img-banner">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BookID")%>' CommandName="detailSee" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"BookUrl") %>' /></td>
                        <td colspan="2" align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align =left style="width: 51px; " >
                         类别名：
                        </td>
                        <td align =left style="  color:#D57421 " >
                         <%#Convert.ToInt32(DataBinder.Eval(Container.DataItem , "ClassID"))%>
                        </td>
                    </tr>
                    <tr>
                        <td align =left style="width: 51px">
                        书  名：
                        </td>
                        <td align =left>
                          <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                        </td>
                    </tr>
                    <tr>
                        <td align =left style="width: 51px">
                         作  者：

                        </td>
                        <td align =left>
                        <%#DataBinder.Eval(Container.DataItem,"Author") %>
                        </td>
                    </tr>
                    <tr>
                        <td align =left style="width: 51px">
                          出版社：

                        </td>
                        <td align =left>
                        <%#DataBinder.Eval(Container.DataItem,"Company") %>
                        </td>
                    </tr>
                </table>
               
            </ItemTemplate>
            <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" ForeColor="Blue" HorizontalAlign="Center" />
        </asp:DataList></marquee>
        </td>
    </tr>

</table>
