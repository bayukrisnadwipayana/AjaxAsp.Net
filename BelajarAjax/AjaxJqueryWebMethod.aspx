<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxJqueryWebMethod.aspx.cs" Inherits="BelajarAjax.AjaxJqueryWebMethod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <label for="id">ID Provinsi</label>
    <br />
    <asp:TextBox ID="idprovinsi" runat="server"></asp:TextBox>
    <br />
    <label for="nama">Nama Provinsi</label>
    <br />
    <asp:TextBox ID="namaprovinsi" runat="server"></asp:TextBox>
    <br />
    <input type="button" id="btnsave" value="Save" onclick="SaveProvinsi()" />
    <input type="button" id="fetchdata" value="Display" onclick="Display()" />
    </div>
    </form>
     
     <script type="text/javascript">
            function SaveProvinsi()
            {
                var param={id:$('#<%= idprovinsi.ClientID %>').val(),
                            nama:$('#<%= namaprovinsi.ClientID %>').val()
                };
                $.ajax({
                    type:'POST',
                    url:'AjaxJqueryWebMethod.aspx/SaveProvinsi',
                    data:JSON.stringify(param),
                    contentType:'application/Json;charset:utf-8',
                    dataType:'Json',
                    success:function(data){},
                    error:function(){}
                });
                swal.fire(
                  'Success',
                  'Data Provinsi Sukses Disimpan',
                  'success'
                )
            }
           function Display()
           {
            $.ajax({
                type:'POST',
                url:'AjaxJqueryWebMethod.aspx/DisplayNama',
                data:'{nama: "'+$("#<%= idprovinsi.ClientID %>").val()+'"}',
                contentType:'application/json;charset=utf-8',
                dataType:'Json',
                success: function sukses(data){
                   swal.fire(
                  'Ajax C#',
                  data.d,
                  'success'
                )
              }
            });
           }
     </script>
</body>
</html>

