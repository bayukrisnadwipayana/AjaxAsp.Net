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
using System.Data.SqlClient;

namespace BelajarAjax
{
    public partial class Provinsi : System.Web.UI.Page
    {
        SqlConnection koneksi = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\USER\Documents\latihan.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        SqlCommand command = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT*FROM provinsi";
                try
                {
                    koneksi.Open();
                    command.Connection = koneksi;
                    command.CommandType = CommandType.Text;
                    command.CommandText = query;
                    SqlDataAdapter da = new SqlDataAdapter(query, koneksi);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "provinsi");
                    provinsi.DataSource = ds;
                    provinsi.DataTextField = "nama_provinsi";
                    provinsi.DataValueField = "id_provinsi";
                    provinsi.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    koneksi.Close();
                }
            }
        }
    }
}
