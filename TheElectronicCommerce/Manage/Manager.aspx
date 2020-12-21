<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="TheElectronicCommerce.Manage.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理会员</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div>
     <table class="tableBorder" cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<th class="tableHeaderText" height="25" align="left">
                        管理会员</th>
					
				<tr>
				</tr>
			</table>
			<table class="tableBorder" cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<td height="23" >
                       <asp:GridView ID="gvMemberList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="MemberID"  Width="100%" HorizontalAlign="Center"
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvMemberList_PageIndexChanging" OnRowDeleting="gvMemberList_RowDeleting">
							<HeaderStyle Font-Bold="True" CssClass="summary-title"></HeaderStyle>
                            <Columns>
                                <asp:BoundField DataField="MemberID" HeaderText="代号" ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="center" Width="40px" />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RealName" HeaderText="真实姓名" >
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Phonecode" HeaderText="电话号码" >
                                    <ItemStyle HorizontalAlign="center"  />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="会员Email" >
                                    <ItemStyle HorizontalAlign="center"  />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="详细地址" >
                                    <ItemStyle HorizontalAlign="center"  Width="100px" />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PostCode" HeaderText="邮编号码">
                                    <ItemStyle HorizontalAlign="center"  />
                                    <HeaderStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:TemplateField  HeaderText="加入日期">
                                <HeaderStyle HorizontalAlign =center />
                                <ItemStyle HorizontalAlign =center />
                                <ItemTemplate>
                                <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
