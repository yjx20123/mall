﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="TheElectronicCommerce.Manage.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台功能区</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" height="600" bgcolor="#ffffff"  >	
				<tr>
					<td valign="top" width="30%">
						<table width="50%">
							<tr>
								<td valign="middle"><img src="../Images/icons_orders.gif"><b><font size="2">订单信息</font></b></td>
							</tr>
							<tr>
								<td>
                                    <asp:GridView id="gvOrderList" runat="server" SkinID ="gvSkin"  OnPageIndexChanging="gvOrderList_PageIndexChanging" AllowPaging="True" AutoGenerateColumns="False" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="单号">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate >
                                                 <a href='OrderModify.aspx?OrderID=<%# DataBinder.Eval(Container.DataItem, "OrderID") %>'>
														<%# DataBinder.Eval(Container.DataItem, "OrderID") %>
												</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="下订单时间">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate >
                                                <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "OrderDate").ToString()).ToLongDateString()%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TotalPrice" HeaderText="订单总金额"  >
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                           
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