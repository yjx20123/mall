using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;
namespace TheElectronicCommerce.Manage
{
    public partial class MemberAdd : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.txtName.Text = "";
            this.txtPassWord.Text = "";
            this.txtTrueName.Text = "";
            this.txtEmail.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strSql = "select * from tb_Admin where AdminName='" + this.txtName.Text.Trim() + "'";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbAdmin");
            if (dsTable.Rows.Count > 0)
            {
                Response.Write(ccObj.MessageBoxPage("该用户名已存在！"));
            }
            else
            {
                string strName = this.txtName.Text.Trim();
                string strPwd = this.txtPassWord.Text.Trim();
                string strTrueName = this.txtTrueName.Text.Trim();
                string strEamil = this.txtEmail.Text.Trim();
                string strAddSql = "Insert into tb_Admin(AdminName,PassWord,RealName,Email)";
                strAddSql += "values('" + strName + "','" + strPwd + "','" + strTrueName + "','" + strEamil + "')";
                SqlCommand myCmd = dbObj.GetCommandStr(strAddSql);
                dbObj.ExecNonQuery(myCmd);
                Response.Write(ccObj.MessageBoxPage("添加成功！"));
            }
        }
    }

}