using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using Coseo.DBUtility;
using Coseo.Common;

namespace Coseo.DAL
{
    /// <summary>
    /// ���ݷ�����:�û�
    /// </summary>
    public partial class users
    {
        private string databaseprefix; //���ݿ����ǰ׺
        public users(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region ��������===========================================
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "users");
            strSql.Append(" where id=@id ");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// ����û����Ƿ����
        /// </summary>
        public bool Exists(string user_name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "users");
            strSql.Append(" where user_name=@user_name ");
            SqlParameter[] parameters = {
					new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            parameters[0].Value = user_name;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// ���ͬһIPע����(Сʱ)���Ƿ����
        /// </summary>
        public bool Exists(string reg_ip, int regctrl)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "users");
            strSql.Append(" where reg_ip=@reg_ip and DATEDIFF(hh,reg_time,getdate())<@regctrl ");
            SqlParameter[] parameters = {
					new SqlParameter("@reg_ip", SqlDbType.NVarChar,30),
                    new SqlParameter("@regctrl", SqlDbType.Int,4)};
            parameters[0].Value = reg_ip;
            parameters[1].Value = regctrl;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// ���Email�Ƿ����
        /// </summary>
        public bool ExistsEmail(string email)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "users");
            strSql.Append(" where email=@email ");
            SqlParameter[] parameters = {
					new SqlParameter("@email", SqlDbType.NVarChar,100)};
            parameters[0].Value = email;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// ����ֻ������Ƿ����
        /// </summary>
        public bool ExistsMobile(string mobile)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "users");
            strSql.Append(" where mobile=@mobile ");
            SqlParameter[] parameters = {
					new SqlParameter("@mobile", SqlDbType.NVarChar,20)};
            parameters[0].Value = mobile;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// �����û���ȡ��Salt
        /// </summary>
        public string GetSalt(string user_name)
        {
            //�����û���ȡ��Salt
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 salt from " + databaseprefix + "users");
            strSql.Append(" where user_name=@user_name");
            SqlParameter[] parameters = {
                    new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            parameters[0].Value = user_name;
            string salt = Convert.ToString(DbHelperSQL.GetSingle(strSql.ToString(), parameters));
            if (!string.IsNullOrEmpty(salt))
            {
                return salt;
            }
            //�������ֻ���ȡ��Salt
            StringBuilder strSql1 = new StringBuilder();
            strSql1.Append("select top 1 salt from " + databaseprefix + "users");
            strSql1.Append(" where mobile=@mobile");
            SqlParameter[] parameters1 = {
                    new SqlParameter("@mobile", SqlDbType.NVarChar,20)};
            parameters1[0].Value = user_name;
            salt = Convert.ToString(DbHelperSQL.GetSingle(strSql1.ToString(), parameters1));
            if (!string.IsNullOrEmpty(salt))
            {
                return salt;
            }
            //����������ȡ��Salt
            StringBuilder strSql2 = new StringBuilder();
            strSql2.Append("select top 1 salt from " + databaseprefix + "users");
            strSql2.Append(" where email=@email");
            SqlParameter[] parameters2 = {
                    new SqlParameter("@email", SqlDbType.NVarChar,50)};
            parameters2[0].Value = user_name;
            salt = Convert.ToString(DbHelperSQL.GetSingle(strSql2.ToString(), parameters2));
            if (!string.IsNullOrEmpty(salt))
            {
                return salt;
            }
            return string.Empty;
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public int Add(Model.users model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into " + databaseprefix + "users(");
            strSql.Append("group_id,user_name,password,salt,email,nick_name,avatar,sex,birthday,telphone,mobile,qq,address,safe_question,safe_answer,amount,point,exp,status,reg_time,reg_ip)");
            strSql.Append(" values (");
            strSql.Append("@group_id,@user_name,@password,@salt,@email,@nick_name,@avatar,@sex,@birthday,@telphone,@mobile,@qq,@address,@safe_question,@safe_answer,@amount,@point,@exp,@status,@reg_time,@reg_ip)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@group_id", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					new SqlParameter("@password", SqlDbType.NVarChar,100),
					new SqlParameter("@salt", SqlDbType.NVarChar,20),
					new SqlParameter("@email", SqlDbType.NVarChar,50),
					new SqlParameter("@nick_name", SqlDbType.NVarChar,100),
					new SqlParameter("@avatar", SqlDbType.NVarChar,255),
					new SqlParameter("@sex", SqlDbType.NVarChar,20),
					new SqlParameter("@birthday", SqlDbType.DateTime),
					new SqlParameter("@telphone", SqlDbType.NVarChar,50),
					new SqlParameter("@mobile", SqlDbType.NVarChar,20),
					new SqlParameter("@qq", SqlDbType.NVarChar,30),
					new SqlParameter("@address", SqlDbType.NVarChar,255),
					new SqlParameter("@safe_question", SqlDbType.NVarChar,255),
					new SqlParameter("@safe_answer", SqlDbType.NVarChar,255),
					new SqlParameter("@amount", SqlDbType.Decimal,5),
					new SqlParameter("@point", SqlDbType.Int,4),
					new SqlParameter("@exp", SqlDbType.Int,4),
					new SqlParameter("@status", SqlDbType.TinyInt,1),
					new SqlParameter("@reg_time", SqlDbType.DateTime),
					new SqlParameter("@reg_ip", SqlDbType.NVarChar,30)};
            parameters[0].Value = model.group_id;
            parameters[1].Value = model.user_name;
            parameters[2].Value = model.password;
            parameters[3].Value = model.salt;
            parameters[4].Value = model.email;
            parameters[5].Value = model.nick_name;
            parameters[6].Value = model.avatar;
            parameters[7].Value = model.sex;
            parameters[8].Value = model.birthday;
            parameters[9].Value = model.telphone;
            parameters[10].Value = model.mobile;
            parameters[11].Value = model.qq;
            parameters[12].Value = model.address;
            parameters[13].Value = model.safe_question;
            parameters[14].Value = model.safe_answer;
            parameters[15].Value = model.amount;
            parameters[16].Value = model.point;
            parameters[17].Value = model.exp;
            parameters[18].Value = model.status;
            parameters[19].Value = model.reg_time;
            parameters[20].Value = model.reg_ip;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }

        /// <summary>
        /// �޸�һ������
        /// </summary>
        public int UpdateField(int id, string strValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "users set " + strValue);
            strSql.Append(" where id=" + id);
            return DbHelperSQL.ExecuteSql(strSql.ToString());
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public bool Update(Model.users model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "users set ");
            strSql.Append("group_id=@group_id,");
            strSql.Append("user_name=@user_name,");
            strSql.Append("password=@password,");
            strSql.Append("salt=@salt,");
            strSql.Append("email=@email,");
            strSql.Append("nick_name=@nick_name,");
            strSql.Append("avatar=@avatar,");
            strSql.Append("sex=@sex,");
            strSql.Append("birthday=@birthday,");
            strSql.Append("telphone=@telphone,");
            strSql.Append("mobile=@mobile,");
            strSql.Append("qq=@qq,");
            strSql.Append("address=@address,");
            strSql.Append("safe_question=@safe_question,");
            strSql.Append("safe_answer=@safe_answer,");
            strSql.Append("amount=@amount,");
            strSql.Append("point=@point,");
            strSql.Append("exp=@exp,");
            strSql.Append("status=@status,");
            strSql.Append("reg_time=@reg_time,");
            strSql.Append("reg_ip=@reg_ip");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4),
					new SqlParameter("@group_id", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					new SqlParameter("@password", SqlDbType.NVarChar,100),
					new SqlParameter("@salt", SqlDbType.NVarChar,20),
					new SqlParameter("@email", SqlDbType.NVarChar,50),
					new SqlParameter("@nick_name", SqlDbType.NVarChar,100),
					new SqlParameter("@avatar", SqlDbType.NVarChar,255),
					new SqlParameter("@sex", SqlDbType.NVarChar,20),
					new SqlParameter("@birthday", SqlDbType.DateTime),
					new SqlParameter("@telphone", SqlDbType.NVarChar,50),
					new SqlParameter("@mobile", SqlDbType.NVarChar,20),
					new SqlParameter("@qq", SqlDbType.NVarChar,30),
					new SqlParameter("@address", SqlDbType.NVarChar,255),
					new SqlParameter("@safe_question", SqlDbType.NVarChar,255),
					new SqlParameter("@safe_answer", SqlDbType.NVarChar,255),
					new SqlParameter("@amount", SqlDbType.Decimal,5),
					new SqlParameter("@point", SqlDbType.Int,4),
					new SqlParameter("@exp", SqlDbType.Int,4),
					new SqlParameter("@status", SqlDbType.TinyInt,1),
					new SqlParameter("@reg_time", SqlDbType.DateTime),
					new SqlParameter("@reg_ip", SqlDbType.NVarChar,30)};
            parameters[0].Value = model.id;
            parameters[1].Value = model.group_id;
            parameters[2].Value = model.user_name;
            parameters[3].Value = model.password;
            parameters[4].Value = model.salt;
            parameters[5].Value = model.email;
            parameters[6].Value = model.nick_name;
            parameters[7].Value = model.avatar;
            parameters[8].Value = model.sex;
            parameters[9].Value = model.birthday;
            parameters[10].Value = model.telphone;
            parameters[11].Value = model.mobile;
            parameters[12].Value = model.qq;
            parameters[13].Value = model.address;
            parameters[14].Value = model.safe_question;
            parameters[15].Value = model.safe_answer;
            parameters[16].Value = model.amount;
            parameters[17].Value = model.point;
            parameters[18].Value = model.exp;
            parameters[19].Value = model.status;
            parameters[20].Value = model.reg_time;
            parameters[21].Value = model.reg_ip;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public bool Delete(int id)
        {
            //��ȡ�û�������
            Model.users model = GetModel(id);
            if (model == null)
            {
                return false;
            }

            List<CommandInfo> sqllist = new List<CommandInfo>();
            //ɾ�����ּ�¼
            StringBuilder strSql1 = new StringBuilder();
            strSql1.Append("delete from " + databaseprefix + "user_point_log ");
            strSql1.Append(" where user_id=@id");
            SqlParameter[] parameters1 = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters1[0].Value = id;
            CommandInfo cmd = new CommandInfo(strSql1.ToString(), parameters1);
            sqllist.Add(cmd);

            //ɾ������¼
            StringBuilder strSql2 = new StringBuilder();
            strSql2.Append("delete from " + databaseprefix + "user_amount_log ");
            strSql2.Append(" where user_id=@id");
            SqlParameter[] parameters2 = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters2[0].Value = id;
            cmd = new CommandInfo(strSql2.ToString(), parameters2);
            sqllist.Add(cmd);

            //ɾ������Ϣ
            StringBuilder strSql3 = new StringBuilder();
            strSql3.Append("delete from " + databaseprefix + "user_message ");
            strSql3.Append(" where post_user_name=@post_user_name or accept_user_name=@accept_user_name");
            SqlParameter[] parameters3 = {
					new SqlParameter("@post_user_name", SqlDbType.NVarChar,100),
                    new SqlParameter("@accept_user_name", SqlDbType.NVarChar,100)};
            parameters3[0].Value = model.user_name;
            parameters3[1].Value = model.user_name;
            cmd = new CommandInfo(strSql3.ToString(), parameters3);
            sqllist.Add(cmd);

            //ɾ��������
            StringBuilder strSql4 = new StringBuilder();
            strSql4.Append("delete from " + databaseprefix + "user_code ");
            strSql4.Append(" where user_id=@id");
            SqlParameter[] parameters4 = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters4[0].Value = id;
            cmd = new CommandInfo(strSql4.ToString(), parameters4);
            sqllist.Add(cmd);

            //ɾ����¼��־
            StringBuilder strSql5 = new StringBuilder();
            strSql5.Append("delete from " + databaseprefix + "user_login_log ");
            strSql5.Append(" where user_id=@id");
            SqlParameter[] parameters5 = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters5[0].Value = id;
            cmd = new CommandInfo(strSql5.ToString(), parameters5);
            sqllist.Add(cmd);

            //ɾ���û���¼
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "users ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;
            cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            int rowsAffected = DbHelperSQL.ExecuteSqlTran(sqllist);
            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public Model.users GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,group_id,user_name,password,salt,email,nick_name,avatar,sex,birthday,telphone,mobile,qq,address,safe_question,safe_answer,amount,point,exp,status,reg_time,reg_ip from " + databaseprefix + "users ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            Model.users model = new Model.users();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["group_id"].ToString() != "")
                {
                    model.group_id = int.Parse(ds.Tables[0].Rows[0]["group_id"].ToString());
                }
                model.user_name = ds.Tables[0].Rows[0]["user_name"].ToString();
                model.password = ds.Tables[0].Rows[0]["password"].ToString();
                model.salt = ds.Tables[0].Rows[0]["salt"].ToString();
                model.email = ds.Tables[0].Rows[0]["email"].ToString();
                model.nick_name = ds.Tables[0].Rows[0]["nick_name"].ToString();
                model.avatar = ds.Tables[0].Rows[0]["avatar"].ToString();
                model.sex = ds.Tables[0].Rows[0]["sex"].ToString();
                if (ds.Tables[0].Rows[0]["birthday"].ToString() != "")
                {
                    model.birthday = DateTime.Parse(ds.Tables[0].Rows[0]["birthday"].ToString());
                }
                model.telphone = ds.Tables[0].Rows[0]["telphone"].ToString();
                model.mobile = ds.Tables[0].Rows[0]["mobile"].ToString();
                model.qq = ds.Tables[0].Rows[0]["qq"].ToString();
                model.address = ds.Tables[0].Rows[0]["address"].ToString();
                model.safe_question = ds.Tables[0].Rows[0]["safe_question"].ToString();
                model.safe_answer = ds.Tables[0].Rows[0]["safe_answer"].ToString();
                if (ds.Tables[0].Rows[0]["amount"].ToString() != "")
                {
                    model.amount = decimal.Parse(ds.Tables[0].Rows[0]["amount"].ToString());
                }
                if (ds.Tables[0].Rows[0]["point"].ToString() != "")
                {
                    model.point = int.Parse(ds.Tables[0].Rows[0]["point"].ToString());
                }
                if (ds.Tables[0].Rows[0]["exp"].ToString() != "")
                {
                    model.exp = int.Parse(ds.Tables[0].Rows[0]["exp"].ToString());
                }
                if (ds.Tables[0].Rows[0]["status"].ToString() != "")
                {
                    model.status = int.Parse(ds.Tables[0].Rows[0]["status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["reg_time"].ToString() != "")
                {
                    model.reg_time = DateTime.Parse(ds.Tables[0].Rows[0]["reg_time"].ToString());
                }
                model.reg_ip = ds.Tables[0].Rows[0]["reg_ip"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// �����û������뷵��һ��ʵ��
        /// </summary>
        public Model.users GetModel(string user_name, string password, int emaillogin, int mobilelogin)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 id from " + databaseprefix + "users");
            strSql.Append(" where (user_name=@user_name");
            if (emaillogin == 1)
            {
                strSql.Append(" or email=@user_name");
            }
            if (mobilelogin == 1)
            {
                strSql.Append(" or mobile=@user_name");
            }
            strSql.Append(") and password=@password and status<3");

            SqlParameter[] parameters = {
					    new SqlParameter("@user_name", SqlDbType.NVarChar,100),
                        new SqlParameter("@password", SqlDbType.NVarChar,100)};
            parameters[0].Value = user_name;
            parameters[1].Value = password;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj != null)
            {
                return GetModel(Convert.ToInt32(obj));
            }

            return null;
        }

        /// <summary>
        /// �����û�������һ��ʵ��
        /// </summary>
        public Model.users GetModel(string user_name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id from " + databaseprefix + "users");
            strSql.Append(" where user_name=@user_name and status<3");
            SqlParameter[] parameters = {
					new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            parameters[0].Value = user_name;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj != null)
            {
                return GetModel(Convert.ToInt32(obj));
            }
            return null;
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" id,group_id,user_name,password,salt,email,nick_name,avatar,sex,birthday,telphone,mobile,qq,address,safe_question,safe_answer,amount,point,exp,status,reg_time,reg_ip ");
            strSql.Append(" FROM " + databaseprefix + "users ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// ��ò�ѯ��ҳ����
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM " + databaseprefix + "users");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        #endregion

    }
}