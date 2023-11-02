<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Mod02_5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>後端串接測試</title>
    <script>
        function CheckNumbaer(obj) {
            var re = /^[0-9]*$/;
            if (!re.test(obj.value)) {
                document.getElementById("TextBox3").value = "";
                alert("只能有數字!!");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="取得所有人員" />
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br />
            <textarea id="txtArea" runat="server" style="width: 100px; height: 150px"></textarea>
            <br />
            <br />
            <hr />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="搜尋人員" />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="人員編號，預設第一位" onkeyup="value=value.replace(/[^0-9]/g,'')"></asp:TextBox>
            <br />
            <br />
            <hr />
            新增人員
            <br />
            <asp:TextBox ID="TextBox2" placeholder="人員名稱" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="新增" />
            <br />
            <br />
            <hr />
            修改 人員編號:<asp:TextBox ID="TextBox3" runat="server" onkeyup="CheckNumbaer(this)"></asp:TextBox>
            <br />
            修改  人員姓名:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="修改" />
            <hr />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="刪除人員" OnClientClick="return confirm('確定要刪除第一位人員嗎?')" />
        </div>
    </form>
</body>
</html>
