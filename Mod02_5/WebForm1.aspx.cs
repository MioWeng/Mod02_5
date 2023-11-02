using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mod02_5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        HttpClient myclient = new HttpClient();

        #region 初始
        protected void Page_Load(object sender, EventArgs e)
        {
            myclient.BaseAddress = new Uri("http://" + Request.Url.Authority);  //當前網址路徑

            if (!IsPostBack)
            {                            
            }
        }
        #endregion

        #region 按鈕事件

        #region 取得人員
        protected void Button1_Click(object sender, EventArgs e)
        {
            IEnumerable<string> data = null;
            HttpResponseMessage resp = myclient.GetAsync("api/Employees").Result;

            if (resp.IsSuccessStatusCode)
            {
                data = resp.Content.ReadAsAsync<IEnumerable<string>>().Result;  //接收資料
            }

            if (data != null)
            {
                txtArea.InnerHtml = "";

                foreach (var item in data)
                {
                    txtArea.InnerHtml += "\r\n" + item;
                }
            }
        }
        #endregion

        #region 尋找人員
        protected void Button2_Click(object sender, EventArgs e)   //找到人員
        {
            string idx = TextBox1.Text.Trim() == "" ? "0" : TextBox1.Text.Trim();
            string uri = "api/employees/" + idx;

            HttpResponseMessage resp = myclient.GetAsync(uri).Result;

            if (resp.IsSuccessStatusCode)
            {
                Label1.Text = "尋找人員編號："+ idx + "= " + resp.Content.ReadAsAsync<string>().Result;
            }
            else
            {
                Label1.Text = "尋找人員編號：" + idx + "失敗";
            }
        }
        #endregion

        #region 新增人員
        protected void Button3_Click(object sender, EventArgs e)  //新增人員
        {
            string myName = TextBox2.Text.Trim() == "" ? "測試人員" : TextBox2.Text.Trim();
            string uri    = "api/employees";

            HttpResponseMessage resp = myclient.PostAsJsonAsync(uri, myName).Result;  //PostAsJsonAsync傳達訊息

            if (resp.IsSuccessStatusCode)  //是否是200Code  代表成功  
            {
                Label1.Text = "inserted!! ，新增人員" + myName + "成功";
                Button1_Click(Button1, new EventArgs());
            }
        }
        #endregion

        #region 修改
        protected void Button4_Click(object sender, EventArgs e)  //選擇id 修改名稱value
        {
            string idx = TextBox3.Text.Trim() == "" ? "0" : TextBox3.Text.Trim();
            string uri = "api/employees/" + idx;

            if (TextBox4.Text == "")
            {
                Response.Write("<script>alert('請輸入人員名稱：\\r 不可空白');</script>");
                return;
            }

            HttpResponseMessage resp = myclient.PutAsJsonAsync(uri, TextBox4.Text).Result;  //PutAsJsonAsync傳達訊息

            if (resp.IsSuccessStatusCode)  //是否是200Code  代表成功
            {
                Label1.Text = "uptated!!，修改人員成功";
                Button1_Click(Button1, new EventArgs());
            }
        }
        #endregion

        #region 刪除
        protected void Button5_Click(object sender, EventArgs e)
        {
            string idx = "0";  //預設刪除第一位
            string uri = "api/employees/" + idx;

            HttpResponseMessage resp = myclient.DeleteAsync(uri).Result;  //DeleteAsync傳達訊息

            if (resp.IsSuccessStatusCode)  //是否是200Code  代表成功
            {
                Label1.Text = "Deleted!，刪除成功";
                Button1_Click(Button1, new EventArgs());
            }
            else
            {
                Label1.Text = "Error!，刪除失敗";
            }
        }
        #endregion

        #endregion
    }
}