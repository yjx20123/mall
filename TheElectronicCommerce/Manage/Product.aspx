<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="TheElectronicCommerce.Manage.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>商品管理</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div>
            <table cellSpacing="0" cellPadding="0" width="640" align="center" border="0" style ="font-family :宋体; font-size :9pt;">
				<tr>
					<td style="font-family :宋体; font-size :9pt; height: 25px;" align="left">
						&nbsp;&nbsp; 商品管理</td>
					
				<tr>
				<tr>
				<td>
				 <table cellSpacing="0" cellPadding="0" width="640" align="center" border="0">
			 <tr>
					
					<td align="center" style ="font-family :宋体; font-size :9pt;">
                        请输入关键字：&nbsp;
						 <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>&nbsp;
						<asp:Button id="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click"></asp:Button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
				</tr>
          
            <tr>
                <td style ="font-family :宋体; font-size :9pt;" >
                    <br />
                    <asp:GridView ID="gvGoodsInfo" runat="server" CellPadding="4" Width="95%" HorizontalAlign="Center" 
							HeaderStyle-CssClass="summary-title" AutoGenerateColumns="False" OnPageIndexChanging="gvGoodsInfo_PageIndexChanging" OnRowDeleting="gvGoodsInfo_RowDeleting" AllowPaging="True" PageSize="5" >
                       <HeaderStyle Font-Bold="True"  Font-Size =Small></HeaderStyle>
                        <Columns>
                            <asp:BoundField DataField="BookID" HeaderText="书籍ID"  >
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BookName" HeaderText="书籍名称">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText ="所属类别">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetClassName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ClassID").ToString())) %>
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:BoundField DataField="Author" HeaderText="主编">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Company" HeaderText="出版社">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:TemplateField HeaderText ="热销价">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetVarStr(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="BookID" DataNavigateUrlFormatString="EditProduct.aspx?BookID={0}" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>				
				</td>
				</tr>
			</table>	
    </div>
    </form>
</body>
</html>
