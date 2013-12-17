<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentUpdate.aspx.cs" Inherits="Admin_studentUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="font-family: Times New Roman">
    <form id="form1" runat="server">
    <div>
        <table align="center" bgcolor="#cccccc" border="1" style="width: 350px">
            <tr>
                <td colspan="3">
                    <div style="display: inline; width: 112px; height: 16px">
                        修改学生记录</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="display: inline; width: 70px; height: 15px">
                        学号:</div>
                </td>
                <td style="width: 825px">
                    <asp:TextBox ID="tbx_stuId" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <div style="display: inline; width: 70px; height: 15px">
                        姓名:</div>
                </td>
                <td style="width: 825px">
                    <asp:TextBox ID="tbx_stuName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><div style="display: inline; width: 70px; height: 15px">
                        密码:</div>
                </td>
                <td style="width: 825px">
                    <asp:TextBox ID="tbx_stuPwd" runat="server">123</asp:TextBox></td>
                    
            </tr>
            <tr>
                <td style="width: 170px">
                    系别:</td>
                <td style="width: 825px">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlClass_SelectedIndexChanged">
                    </asp:DropDownList></td>
               
                <td style="width: 784px">
                </td>
            </tr>
            <tr><td style="height: 24px"><div style="display: inline; width: 70px; height: 15px">
                        性别</div>
                </td>
                <td style="height: 24px; width: 825px;">
                    <font
                        face="宋体"> &nbsp;&nbsp; &nbsp;
                        <asp:RadioButtonList ID="rblSex" runat="server" AutoPostBack="True" RepeatColumns="2">
                            <asp:ListItem Value="0">男</asp:ListItem>
                            <asp:ListItem Value="1">女</asp:ListItem>
                        </asp:RadioButtonList></font></td>
                <td style="height: 24px; width: 784px;">
                    
            </tr>
            
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" /></td>
                <td align="center" style="width: 825px">
                    <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" /></td>
            </tr>
            <tr>
            <td></td>
            <td style="width: 825px">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 784px"></td>
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


public partial class Admin_studentUpdate : System.Web.UI.Page
{
    string id;
    SqlConnection conn = new SqlConnection("server=localhost;database=xTest;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //id = Request.QueryString["StudentID"].ToString();
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
            SqlCommand cmd = new SqlCommand("select * from tb_Student where StudentID='" + Session["StudentID"].ToString() + "'", conn);
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
                //rblSex.SelectedValue = ;

                //Label1.Text = ddlClass.Items[1].Value.ToString();
                //在"下拉列表"中查找这条记录的"ClassID"的索引值，并在"下拉列表"中显示出当前记录的值
                string classIDStr = sdr["ClassID"].ToString();
                int k = 0;
                for (int i = 0; i < ddlClass.Items.Count; i++)
                {
                    if (ddlClass.Items[i].Value.ToString() == classIDStr)
                        k = i;
                }
                ddlClass.SelectedIndex = k;

                //txtDescription.Text = sdr["Description"].ToString();
            }
            conn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("infoView.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (tbx_stuName.Text.Trim() == "" || tbx_stuPwd.Text.Trim() == "")
        {
            
            Label1.Text = "请将姓名和密码信息填写完整。";
            return;
        }
        else
        {
            
            string str = "update tb_Student set StudentName='" + tbx_stuName.Text.Trim() + "',StudentPwd='"
            + tbx_stuPwd.Text.Trim() + "',Sex='" +rblSex.SelectedItem.ToString() +
           "',ClassID='" + ddlClass.SelectedValue.ToString() +
            //"','" + txtDescription.Text.Trim() + 
            "' where ID='" + Session["StudentID"].ToString() + "'";
        //BaseClass.OperateData(str);
        SqlConnection conn = BaseClass.DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
            
        }
        Button2_Click(sender, e);
        //Response.Redirect("infoView.aspx");
    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

