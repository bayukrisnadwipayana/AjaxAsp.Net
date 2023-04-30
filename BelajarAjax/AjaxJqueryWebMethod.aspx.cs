using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;
using System.Data.SqlClient;

namespace BelajarAjax
{
    public partial class AjaxJqueryWebMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DisplayDataBase()
        {

        }
        [WebMethod]
        public static void SaveProvinsi(string id, string nama)
        {
            SqlConnection koneksi = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\USER\Documents\latihan.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            string query = "INSERT INTO provinsi VALUES(@id,@nama)";
            SqlCommand command = new SqlCommand();
            try
            {
                koneksi.Open();
                command.Connection = koneksi;
                command.CommandType = CommandType.Text;
                command.CommandText = query;
                command.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                command.Parameters.Add("@nama", SqlDbType.VarChar).Value = nama;
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            finally
            {
                koneksi.Close();
            }
        }
    }
}
