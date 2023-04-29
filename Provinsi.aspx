<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Provinsi.aspx.cs" Inherits="BelajarAjax.Provinsi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
        $('document').ready(function(){
            $('#provinsi').change(function(e){
                $('#kota').html('<img src="Loading_icon.gif">');
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>

    <form id="form1" runat="server">
    <div>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
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
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    <table>
        <tr>
            <td>Provinsi</td>
            <td>: <select name="provinsi" id="provinsi1" runat="server" style="width:100px">
                  </select>
            </td>
        </tr>
        <tr>
            <td>Kota</td>
            <td>: <span id="kota1"></span></td>
        </tr>
    </table>
    </div>
    </form>
</body>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</html>
