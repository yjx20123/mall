using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace BLL
{
   public  class DBClass
    {
        public DBClass()
        {

        }
       
        /// <summary>
        /// 连接数据库
        /// </summary>
        /// <returns>返回SqlConnection对象</returns>
        public SqlConnection GetConnection()
        {
            string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
            SqlConnection myConn = new SqlConnection(myStr);
            return myConn;
        }
        /// <summary>
        /// 执行SQL语句，并返回受影响的行数
        /// </summary>
        /// <param name="myCmd">执行SQL语句命令的SqlCommand对象</param>
        public void ExecNonQuery(SqlCommand myCmd)
        {
            try
            {
                if (myCmd.Connection.State != ConnectionState.Open)
                {
                    myCmd.Connection.Open(); //打开与数据库的连接
                }
                //使用SqlCommand对象的ExecuteNonQuery方法执行SQL语句，并返回受影响的行数
                myCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally
            {
                if (myCmd.Connection.State == ConnectionState.Open)
                {
                    myCmd.Connection.Close(); //关闭与数据库的连接
                }
            }
        }
        /// <summary>
        /// 执行查询，并返回查询所返回的结果集中第一行的第一列。所有其他的列和行将被忽略。 
        /// </summary>
        /// <param name="myCmd"></param>
        /// <returns>执行SQL语句命令的SqlCommand对象</returns>
        public string ExecScalar(SqlCommand myCmd)
        {
            string strSql;
            try
            {
                if (myCmd.Connection.State != ConnectionState.Open)
                {
                    myCmd.Connection.Open(); //打开与数据库的连接
                }
                //使用SqlCommand对象的ExecuteScalar方法执行查询，并返回查询所返回的结果集中第一行的第一列。所有其他的列和行将被忽略。 

                strSql = Convert.ToString(myCmd.ExecuteScalar());
                return strSql;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally
            {
                if (myCmd.Connection.State == ConnectionState.Open)
                {
                    myCmd.Connection.Close();//关闭与数据库的连接
                }
            }
        }
        /// <summary>
        /// 说  明：  返回数据集的表的集合
        ///	返回值：  数据源的数据表
        ///	参  数：  myCmd 执行SQL语句命令的SqlCommand对象，TableName 数据表名称
        /// </summary>
        public DataTable GetDataSet(SqlCommand myCmd, string TableName)
        {
            SqlDataAdapter adapt;
            DataSet ds = new DataSet();
            try
            {
                if (myCmd.Connection.State != ConnectionState.Open)
                {
                    myCmd.Connection.Open();
                }
                adapt = new SqlDataAdapter(myCmd);
                adapt.Fill(ds, TableName);
                return ds.Tables[TableName];

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }
            finally
            {
                if (myCmd.Connection.State == ConnectionState.Open)
                {
                    myCmd.Connection.Close();

                }
            }

        }
        
        public SqlCommand GetCommandProc(string strProcName)
        {
            SqlConnection myConn = GetConnection();
            SqlCommand myCmd = new SqlCommand();
            myCmd.Connection = myConn;
            myCmd.CommandText = strProcName;
            myCmd.CommandType = CommandType.StoredProcedure;
            return myCmd;
        }
        
        public SqlCommand GetCommandStr(string strSql)
        {
            SqlConnection myConn = GetConnection();
            SqlCommand myCmd = new SqlCommand();
            myCmd.Connection = myConn;
            myCmd.CommandText = strSql;
            myCmd.CommandType = CommandType.Text;
            return myCmd;
        }
        
        public DataTable GetDataSetStr(string sqlStr, string TableName)
        {
            SqlConnection myConn = GetConnection();
            myConn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(sqlStr, myConn);
            adapt.Fill(ds, TableName);
            myConn.Close();
            return ds.Tables[TableName];
        }
    }


}
