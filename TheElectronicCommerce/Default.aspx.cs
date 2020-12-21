using BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheElectronicCommerce
{
    public partial class Default : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        GoodsClass gcObj = new GoodsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefineBind();
                HotBind();
                DiscountBind();
            }
        }
        //绑定市场价格
        public string GetVarMKP(string strMarketPrice)
        {
            return ccObj.VarStr(strMarketPrice, 2);
        }
        //绑定热卖价格
        public string GetVarHot(string strHotPrice)
        {
            return ccObj.VarStr(strHotPrice, 2);
        }
        protected void RefineBind()
        {
            gcObj.DLDeplayGI(1, this.dLRefine, "Refine");
        }
        protected void HotBind()
        {
            gcObj.DLDeplayGI(3, this.dlHot, "Hot");
        }
        protected void DiscountBind()
        {
            gcObj.DLDeplayGI(2, this.dlDiscount, "Discount");
        }
        public void AddressBack(DataListCommandEventArgs e)
        {
            Session["address"] = "";
            Session["address"] = "Default.aspx";
            Response.Redirect("~/showInfo.aspx?id=" + Convert.ToInt32(e.CommandArgument.ToString()));
        }

        protected void dLRefine_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                AddressBack(e);
            }
            else if (e.CommandName == "buy")
            {
                AddShopCart(e);
            }

        }
        protected void dlDiscount_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                AddressBack(e);
            }
            else if (e.CommandName == "buy")
            {
                AddShopCart(e);
            }

        }
        protected void dlHot_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                AddressBack(e);
            }
            else if (e.CommandName == "buy")
            {
                AddShopCart(e);
            }

        }
        /// <summary>
        /// 向购物车中添加新商品
        /// </summary>
        /// <param name="e">
        /// 获取或设置可选参数，
        /// 该参数与关联的 CommandName 
        /// 一起被传递到 Command 事件。
        /// </param> 
        public void AddShopCart(DataListCommandEventArgs e)
        {
            Hashtable hashCar;
            if (Session["ShopCart"] == null)
            {
                //如果用户没有分配购物车
                hashCar = new Hashtable();         //新生成一个
                hashCar.Add(e.CommandArgument, 1); //添加一个商品
                Session["ShopCart"] = hashCar;     //分配给用户
            }
            else
            {
                //用户已经有购物车
                hashCar = (Hashtable)Session["ShopCart"];//得到购物车的hash表
                if (hashCar.Contains(e.CommandArgument))//购物车中已有此商品，商品数量加1
                {
                    int count = Convert.ToInt32(hashCar[e.CommandArgument].ToString());//得到该商品的数量
                    hashCar[e.CommandArgument] = (count + 1);//商品数量加1
                }
                else
                    hashCar.Add(e.CommandArgument, 1);//如果没有此商品，则新添加一个项
            }

        }


        
    }
}