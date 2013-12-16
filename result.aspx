<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="Student_result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
    <table align="center" width="612" border="10"   bordercolorlight="#ffff99" cellpadding="2" cellspacing="0" >
    <tr>
    <td align="center" style="width: 500px"><asp:Label ID="labeltishi" runat="server" Font-Bold="true" ForeColor="Green" Font-Size=13px Text=""></asp:Label>
    考生:<asp:Label ID="label1" runat="server" Text="" Font-Bold="true" ForeColor="Red"/>
        <br />
   <%-- &nbsp;的最后得分为:<asp:Label ID="label2" runat="server" Text="" Font-Bold="true" ForeColor="Red"/>
    &nbsp;<asp:LinkButton ID="link" runat="server" Text="退出系统" OnClick="link_Click"></asp:LinkButton>--%>
        <table style="width: 682px; height: 168px">
            <tr style="font-size: 12pt">
                <td style="height: 2px; width: 11px;">
                </td>
                <td style="width: 613px; height: 2px">
                    <asp:Label ID="Label3" runat="server" Height="24px" Text="关键字："></asp:Label><asp:TextBox
                        ID="tbx_query" runat="server"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Height="23px" Text="查询条件："></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>试卷编号</asp:ListItem>
                        <asp:ListItem>总成绩</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btncx" runat="server" OnClick="btncx_Click" Text="查询" /></td>
                <td style="height: 2px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="height: 6px; width: 11px;">
                </td>
                <td style="width: 613px; height: 6px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="13px"
                        Width="649px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="ExamID" HeaderText="试卷编号" />
                            <asp:BoundField DataField="SChooseResult" HeaderText="单选成绩" />
                            <asp:BoundField DataField="MChooseResult" HeaderText="多选成绩" />
                            <asp:BoundField DataField="JudgeResult" HeaderText="判断成绩" />
                            <asp:BoundField DataField="InputResult" HeaderText="填空成绩" />
                            <asp:BoundField DataField="ApplicationResult" HeaderText="应用成绩" />
                            <asp:BoundField DataField="TotalResult" HeaderText="总成绩" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="height: 6px">
                </td>
            </tr>
        </table>
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

public partial class Student_result : System.Web.UI.Page
{
 


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentID"] == null)
        {
            Response.Redirect("Login.aspx");
         }

            if (!IsPostBack)
            {
                string str = "select * from tb_examResult where StudentID='" + Session["StudentID"].ToString() + "'";

                BaseClass.BindDG(GridView1, "ID", str, "stuinfo");
                string strsql = "select * from tb_student where StudentID='" + Session["StudentID"].ToString() + "'";
                SqlConnection conn = BaseClass.DBCon();
                conn.Open();
                SqlCommand cmd = new SqlCommand(strsql, conn);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    label1.Text = sdr["StudentName"].ToString().Trim();
                }
                conn.Close();

                
            }
           
    
            
}
    protected void link_Click(object sender, EventArgs e)
    {
        //Session.Clear();
        //Response.Write("<script>javascript:location.href='index.aspx'</script>");
    }
    protected void btncx_Click(object sender, EventArgs e)
    {
        if (tbx_query.Text == "")
        {
            string strsql = "select * from tb_examResult where StudentID='" + Session["StudentID"].ToString() + "'";
            BaseClass.BindDG(GridView1, "ID", strsql, "stuinfo");
        }
        else
        {
            string stype = DropDownList1.SelectedItem.Text;
            string strsql = "";
            switch (stype)
            {
                
                case "试卷编号":
                    strsql = "select * from tb_examResult where ExamID like '%" + tbx_query.Text.Trim() + "%'";
                    BaseClass.BindDG(GridView1, "ID", strsql, "stuinfo");
                    break;
                case "总成绩":
                    strsql = "select * from tb_examResult where TotalResult like '%" + tbx_query.Text.Trim() + "%'";
                    BaseClass.BindDG(GridView1, "ID", strsql, "stuinfo");
                    break;

            }
        }
    }
}



