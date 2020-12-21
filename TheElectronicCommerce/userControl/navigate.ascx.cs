using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BLL;

namespace TheElectronicCommerce.userControl
{
    public partial class navigate : System.Web.UI.UserControl
    {
        GoodsClass gcObj = new GoodsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gcObj.DLClassBind(this.dlClass);
                gcObj.DLNewGoods(this.dlNewGoods);

            }
        }
        protected void dlClass_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                Response.Redirect("goodsList.aspx?id=" + e.CommandArgument);
            }
        }
        public string GetClassName(int IntClassID)
        {
            return gcObj.GetClass(IntClassID);
        }
        protected void dlNewGoods_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                Session["address"] = "";
                Session["address"] = "Default.aspx";
                Response.Redirect("~/showInfo.aspx?id=" + Convert.ToInt32(e.CommandArgument.ToString()));
            }

        }
    }
}