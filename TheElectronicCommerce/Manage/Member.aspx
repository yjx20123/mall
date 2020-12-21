<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="TheElectronicCommerce.Manage.Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理管理员</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div>
     <table  cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<td  height="25" align="left" style ="font-family :宋体; font-size :9pt;">
                        &nbsp; 管理管理员</td>
					
				<tr>
				<tr>
				<td>
				<table  cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
				<tr>
					<td style="height: 23px;font-family :宋体; font-size :9pt;">
                        &nbsp;<asp:GridView ID="gvAdminList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="AdminID"  Width="100%" HorizontalAlign="Center" CellPadding =4
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvAdminList_PageIndexChanging"  OnRowDeleting="gvAdminList_RowDeleting" >
							<HeaderStyle Font-Bold="True" CssClass="summary-title"></HeaderStyle>
                            <Columns>
                                <asp:BoundField DataField="AdminID" HeaderText="代号" ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="center" Width="40px" />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AdminName" HeaderText="用户名称" >
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Password" HeaderText="密码"  HeaderStyle-HorizontalAlign =center ItemStyle-HorizontalAlign =center />
                                <asp:BoundField DataField="RealName" HeaderText="真实名"  HeaderStyle-HorizontalAlign =center ItemStyle-HorizontalAlign =center />
                                <asp:BoundField DataField="Email" HeaderText="Email"  HeaderStyle-HorizontalAlign =center ItemStyle-HorizontalAlign =center  ItemStyle-Width="100px"/>
                                 <asp:TemplateField  HeaderText="加入日期">
                                <HeaderStyle HorizontalAlign =center />
                                <ItemStyle HorizontalAlign =center />
                                <ItemTemplate>
                                <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" >
                                    <ItemStyle HorizontalAlign="center" Width="30px" />
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
        `
    </form>
</body>
</html>
