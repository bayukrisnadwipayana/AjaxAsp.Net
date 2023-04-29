<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Provinsi.aspx.cs" Inherits="BelajarAjax.Provinsi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
        $('document').ready(function(){
            $('#provinsi').change(function(e){
                //$('#kota').html('<img src="Loading_icon.gif">');
                var provinsi=$(this).val();
                $.ajax({
                    type:"POST",
                    url:"Kecamatan.aspx?namaprovinsi="+provinsi,
                    success:function(data){
                        $('#kota').html(data);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>Provinsi</td>
            <td>: <select name="provinsi" id="provinsi" runat="server" style="width:100px">
                  </select>
            </td>
        </tr>
        <tr>
            <td>Kota</td>
            <td>: <span id="kota"></span></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
