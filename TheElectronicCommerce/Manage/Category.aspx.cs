﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheElectronicCommerce.Manage
{
    public partial class Category : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                gvBind();
            }
        }
        public void gvBind()
        {
            string strSql = "select * from tb_Class";
            DataTable dbTable = dbObj.GetDataSetStr(strSql, "tbClass");
            this.gvCategoryList.DataSource = dbTable.DefaultView;
            this.gvCategoryList.DataKeyNames = new string[] { "ClassID" };
            this.gvCategoryList.DataBind();
        }

        protected void gvCategoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategoryList.PageIndex = e.NewPageIndex;
            gvBind();

        }
        protected void gvCategoryList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IntClassID = Convert.ToInt32(gvCategoryList.DataKeys[e.RowIndex].Value);
            string strSql = "select count(*) from tb_BookInfo where ClassID=" + IntClassID;
            SqlCommand myCmd = dbObj.GetCommandStr(strSql);
            if (Convert.ToInt32(dbObj.ExecScalar(myCmd)) != 0)
            {
                Response.Write(ccObj.MessageBox("该类别名正被使用，无法删除！"));
                return;
            }
            else
            {
                string strDelSql = "delete from tb_Class where ClassID=" + IntClassID;
                SqlCommand myDelCmd = dbObj.GetCommandStr(strDelSql);
                dbObj.ExecNonQuery(myDelCmd);
                gvBind();

            }


        }
    }
}