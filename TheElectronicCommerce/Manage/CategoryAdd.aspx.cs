using BLL;
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
    public partial class CategoryAdd : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string strSql = "select * from tb_Image";
                DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
                this.ddlUrl.DataSource = dsTable.DefaultView;
                this.ddlUrl.DataTextField = dsTable.Columns[1].ToString();
                this.ddlUrl.DataValueField = dsTable.Columns[2].ToString();
                this.ddlUrl.DataBind();

            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.txtName.Text == "")
            {
                Response.Write(ccObj.MessageBoxPage("请输入商品类别！"));
            }
            else
            {
                string sqlStr = "select * from tb_Class where ClassName='" + this.txtName.Text.Trim() + "'";
                DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "tbClass");
                if (dsTable.Rows.Count > 0)
                {
                    Response.Write(ccObj.MessageBoxPage("该商品类别名已存在！"));
                }
                else
                {
                    string strAddSql = "Insert into tb_Class(ClassName,CategoryUrl) values ('" + this.txtName.Text.Trim() + "','" + this.ddlUrl.SelectedValue.ToString() + "')";
                    SqlCommand myCmd = dbObj.GetCommandStr(strAddSql);
                    dbObj.ExecNonQuery(myCmd);
                    Response.Write(ccObj.MessageBox("添加成功！"));
                }
            }

        }
        protected void ddlUrl_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ImageMapPhoto.ImageUrl = ddlUrl.SelectedItem.Value;
        }
    }
}