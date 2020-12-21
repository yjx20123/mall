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
    public partial class ProductAdd : System.Web.UI.Page
    {
        
        DBClass dbObj = new DBClass();
        CommonClass ccObj = new CommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                ddlClassBind(); //绑定商品类别
                ddlUrlBind();   //绑定商品供选图像
            }
        }
        public void ddlClassBind()
        {
            string strSql = "select * from tb_Class";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbClass");
            //将商品类别信息绑定到DropDownList控件中
            this.ddlCategory.DataSource = dsTable.DefaultView;
            this.ddlCategory.DataTextField = dsTable.Columns[1].ToString();//绑定商品类别名
            this.ddlCategory.DataValueField = dsTable.Columns[0].ToString();//绑定商品类别号
            this.ddlCategory.DataBind();
        }
        public void ddlUrlBind()
        {
            string strSql = "select * from tb_Image";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
            //将供选图像绑定到DropDownList控件中
            this.ddlUrl.DataSource = dsTable.DefaultView;
            this.ddlUrl.DataTextField = dsTable.Columns[1].ToString();//绑定图像名
            this.ddlUrl.DataValueField = dsTable.Columns[2].ToString();//绑定图像路径
            this.ddlUrl.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int IntClassID = Convert.ToInt32(this.ddlCategory.SelectedValue.ToString());//商品类别号
            string strBookName = this.txtName.Text.Trim();                      //商品类别名
            string strBookDesc = this.txtShortDesc.Text.Trim();                 //商品简短描述
            string strAuthor = this.txtAuthor.Text.Trim();                      //书籍作者
            string strCompany = this.txtCompany.Text.Trim();                    //书籍出版社
            string strBookUrl = this.ddlUrl.SelectedValue.ToString();           //商品图像路径
            float fltMarketPrice = float.Parse(this.txtMarketPrice.Text.Trim());//商品市场价
            float fltHotPrice = float.Parse(this.txtHotPrice.Text.Trim());      //商品热销价
            bool blrefine = Convert.ToBoolean(this.cbxCommend.Checked);        //是否推价
            bool blHot = Convert.ToBoolean(this.cbxHot.Checked);              //是否热销
            bool blDiscount = Convert.ToBoolean(this.cbxDiscount.Checked);//是否打折
            string strSql = "select * from tb_BookInfo where BookName='" + strBookName + "'and Author='" + strAuthor + "'and Company='" + strCompany + "'";
            DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbBI");
            if (dsTable.Rows.Count > 0)
            {
                Response.Write(ccObj.MessageBox("该商品已存在！"));
            }
            else
            {//将商品信息插入数据库中
                string strAddSql = "Insert into tb_BookInfo(ClassID,BookName,BookIntroduce,Author,Company,BookUrl,MarketPrice,HotPrice,Isrefinement,IsHot,IsDiscount)";
                strAddSql += "values ('" + IntClassID + "','" + strBookName + "','" + strBookDesc + "','" + strAuthor + "','" + strCompany + "','" + strBookUrl + "','" + fltMarketPrice + "','" + fltHotPrice + "','" + blrefine + "','" + blHot + "','" + blDiscount + "')";
                SqlCommand myCmd = dbObj.GetCommandStr(strAddSql);
                dbObj.ExecNonQuery(myCmd);
                Response.Write(ccObj.MessageBox("添加成功！"));

            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtName.Text = "";
            this.txtAuthor.Text = "";
            this.txtCompany.Text = "";
            this.txtMarketPrice.Text = "";
            this.txtHotPrice.Text = "";
            this.txtShortDesc.Text = "";

        }

        protected void ddlUrl_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ImageMapPhoto.ImageUrl = ddlUrl.SelectedItem.Value;
        }
    }

}