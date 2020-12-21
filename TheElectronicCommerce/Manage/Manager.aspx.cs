using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BLL;


namespace TheElectronicCommerce.Manage
{
    public partial class Manager : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                gvMemberBind();
            }
        }
        public void gvMemberBind()
        {
            string strSql = "select * from tb_Member";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbMember");
            this.gvMemberList.DataSource = dsTable.DefaultView;
            this.gvMemberList.DataKeyNames = new string[] { "MemberID" };
            this.gvMemberList.DataBind();
        }
        protected void gvMemberList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMemberList.PageIndex = e.NewPageIndex;
            gvMemberBind();
        }
        protected void gvMemberList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string strSql = "delete from tb_Member where MemberID=" + Convert.ToInt32(gvMemberList.DataKeys[e.RowIndex].Value.ToString());
            SqlCommand myCmd = dbObj.GetCommandStr(strSql);
            dbObj.ExecNonQuery(myCmd);
            gvMemberBind();
        }

    }
}