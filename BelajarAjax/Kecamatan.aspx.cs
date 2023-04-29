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
    public partial class Kecamatan : System.Web.UI.Page
    {
        SqlConnection koneksi = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\USER\Documents\latihan.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        SqlCommand command = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT * FROM kecamata WHERE id_provinsi='" + Request.QueryString["namaprovinsi"] + "'";
                try
                {
                    koneksi.Open();
                    command.Connection = koneksi;
                    command.CommandType = CommandType.Text;
                    command.CommandText = query;
                    //command.Parameters.Add("@id_provinsi", SqlDbType.VarChar).Value = Request.Form["provinsi"];
                    SqlDataAdapter da = new SqlDataAdapter(query, koneksi);
                    DataTable dt=new DataTable();
                    da.Fill(dt);
                    Response.Write("<select name='kecamatan'>");        
                    foreach (DataRow row in dt.Rows)
                    {
                        Response.Write("<option value='" + row["id_kecamatan"] + "' style='width:100px'>" + row["nama_kecamatan"] + "</option>");
                    }
                    Response.Write("</select>");
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
