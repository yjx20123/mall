using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data.SqlClient;

namespace TheElectronicCommerce
{
    public partial class login : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        DBClass dbObj = new DBClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.labCode.Text = ccObj.RandomNum(4);//产生验证码
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //判断用户是否已输入了必要的信息
            if (this.textName.Text.Trim() == "" || this.ttPassWord.Text.Trim() == "")
            {
                Response.Write(ccObj.MessageBox("登录名和密码不能为空！"));
            }
            else
            {
                //判断用户输入的验证码是否正确
                if (ttword.Text.Trim() == labCode.Text.Trim())
                {
                    //定义一个字符串，获取用户信息
                    string strSql = "select * from tb_Admin where AdminName='" + this.textName.Text.Trim() + "' and Password='" + this.ttPassWord.Text.Trim() + "'";
                    DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbAdmin");
                    if (dsTable.Rows.Count > 0)
                    {
                        Session["AID"] = Convert.ToInt32(dsTable.Rows[0][0].ToString());//保存用户ID
                        Session["AName"] = dsTable.Rows[0][1].ToString();//保存用户名
                        Response.Redirect("~/Manage/AdminIndex.aspx");
                    }
                    else
                    {
                        Response.Write(ccObj.MessageBox("您输入的用户名或密码错误，请重新输入！"));
                    }
                }
                else
                {
                    Response.Write(ccObj.MessageBox("验证码输入有误，请重新输入！"));
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close();location='javascript:history.go(-1)';</script>");
        }

        
    }
}