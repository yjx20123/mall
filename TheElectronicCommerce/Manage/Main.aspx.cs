using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data.SqlClient;
using System.Data;

namespace TheElectronicCommerce.Manage
{
    public partial class Main : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                gvNewOBind();
            }
        }
        public void gvNewOBind()
        {
            string strSql = "select OrderID,OrderDate,Round(TotalPrice,2)as TotalPrice from tb_OrderInfo where DATEDIFF(day, OrderDate, getdate()) < 1";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
            this.gvOrderList.DataSource = dsTable.DefaultView;
            this.gvOrderList.DataKeyNames = new string[] { "OrderID" };
            this.gvOrderList.DataBind();
        }
        protected void gvOrderList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrderList.PageIndex = e.NewPageIndex;
            gvNewOBind();

        }
    }
}