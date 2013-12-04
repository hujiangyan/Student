<%@ Page Language="C#" AutoEventWireup="true" CodeFile="infoView.aspx.cs" Inherits="Student_infoView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" bgcolor="#cccccc" border="1" style="width: 326px">
            <tr>
                <td colspan="3">
                    <div style="display: inline; width: 112px; height: 16px">
                        学生信息</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="display: inline; width: 70px; height: 15px">
                        学号:</div>
                </td>
                <td style="width: 673px">
                    <asp:TextBox ID="tbx_stuId" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <div style="display: inline; width: 70px; height: 15px">
                        姓名:</div>
                </td>
                <td style="width: 673px">
                    <asp:TextBox ID="tbx_stuName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <div style="display: inline; width: 70px; height: 15px">
                        密码:</div>
                </td>
                <td style="width: 673px">
                    <asp:TextBox ID="tbx_stuPwd" runat="server">123</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 170px">
                    系别<span style="font-family: 宋体">:</span></td>
                <td style="width: 673px">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td style="width: 98px">
                </td>
            </tr>
            <tr>
                <td style="height: 24px">
                    <div style="display: inline; width: 70px; height: 15px">
                        性别:</div>
                </td>
                <td style="height: 24px; width: 673px;">
                    <font face="宋体">&nbsp;&nbsp; &nbsp;
                        <asp:RadioButtonList ID="rblSex" runat="server" AutoPostBack="True" RepeatColumns="2">
                            <asp:ListItem Value="0">男</asp:ListItem>
                            <asp:ListItem Value="1">女</asp:ListItem>
                        </asp:RadioButtonList></font></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td>
                  <%--  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />--%></td>
                <td align="center" style="width: 673px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="取消" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 673px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>







using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Student_infoView : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("server=localhost;database=xTest;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection conn = BaseClass.DBCon();
            conn.Open();
            string cmdStr = "select * from tb_Class ";
            SqlCommand cmdDDL = new SqlCommand(cmdStr, conn);
            SqlDataReader sdrDDL = cmdDDL.ExecuteReader();
            ddlClass.DataSource = sdrDDL;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassName";
            ddlClass.DataBind();
            conn.Close();
            conn.Open();
            string str = "select * from tb_Student where StudentID='" + Session["StudentID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(str, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                tbx_stuName.Text = sdr["StudentName"].ToString();
                tbx_stuId.Text = sdr["StudentID"].ToString();
                tbx_stuPwd.Text = sdr["StudentPwd"].ToString();
                for (int a = 0; a < (int)rblSex.Items.Count; a++)
                {
                    if (rblSex.Items[a].Text == sdr["Sex"].ToString().Trim())
                        rblSex.Items[a].Selected = true;
                }
               
                string classIDStr = sdr["ClassID"].ToString();
                int k = 0;
                for (int i = 0; i < ddlClass.Items.Count; i++)
                {
                    if (ddlClass.Items[i].Value.ToString() == classIDStr)
                        k = i;
                }
                ddlClass.SelectedIndex = k;

               
            }
            conn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
