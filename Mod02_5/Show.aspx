<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="Mod02_5.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>
        &nbsp;
    </p>
    EmployeesID:<input id="txtID" type="text" /><br />
    EmployesesName:<input id="txtName" type="text" /><br />
    <br />
    <input id="btnGetName" type="button" value="GetName" />
    <input id="btnInsert" type="button" value="Insert" />
    <input id="btnUpdate" type="button" value="Update" />
    <input id="btnDelete" type="button" value="Delete" />
    <input id="btnList" type="button" value="List" /><br />
    <br />
    <br />
    <ul id="list">
    </ul>

    <script src="Scripts/jquery-3.1.1.js"></script>
    <script>

        $(function () {   //新增  要用post
            $("#btnInsert").click(function () {
                var myName = "=" + $("#txtName").val();
                $.ajax({
                    type: "POST",
                    url: "api/employees",
                    data: myName,
                    async: false
                });
                ShowList();
            });

            //update
            $("#btnUpdate").click(function () {
                var myName = "=" + $("#txtName").val();
                $.ajax({
                    type: "PUT",
                    url: "/api/employees/" + $("#txtID").val(), //注意url寫法 /api/employees/
                    data: myName,
                });
            });

            //Delete
            $("#btnDelete").click(function () {

                $.ajax({
                    type: "DELETE",
                    url: "/api/employees/" + $("#txtID").val(),

                });
            });

            //lsit 顯示出所有員工清單 
            $("#btnList").click(function () {
                ShowList();
            });

            function ShowList() {
                console.log('執行');
                $("#list").empty();   //每次按一次 就清除再開始
                $.ajax({
                    type: "GET",
                    url: "/api/employees",
                    success: function (data) {
                        //console.log(data);
                        data.forEach(function (item) {
                            //console.log(item);   //這邊先測試  F12
                            $("#list").append($("<li>").text(item));  //li因為不能寫死 所以在這邊用foreach的方式 排列
                        });
                    }
                });
            }

            //輸入id 找出相對應員工
            $("#btnGetName").click(function () {
                $.ajax({
                    type: "GET",
                    url: "/api/employees/" + $("#txtID").val(),  //相當於 網頁的api/employess/0  後方的索引值  拼出這樣的寫法
                    success: function (data) {
                        $("#txtName").val(data);
                    },
                    error: $("#txtName").val("查無人員")
                });
            });
        })

    </script>
</body>
</html>
