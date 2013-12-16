<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentexam.aspx.cs" Inherits="Student_text" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        &nbsp;<table>
            <tr>
                <td style="width: 57px; height: 88px;">
                </td>
                <td style="width: 636px; text-align: left; height: 88px;">
                    <asp:Panel ID="panelstart" runat="server">
                        尊敬的
                        <asp:Label ID="lblusername" runat="server"></asp:Label>考生，您好！请点击开始答题进入考试状态。
                        <asp:Button ID="btnstart" runat="server" Text="开始答题" OnClick="btnstart_Click" /></asp:Panel><table>
                           <tr>
                                <td style="width: 20915px; height: 21px;" colspan="2">
                                    <asp:Button ID="btnSchoose" runat="server" Enabled="False" OnClick="btnSchoose_Click"
                                        Text="单选题" /><%--<asp:Button ID="btnMchoose" runat="server" Enabled="False" OnClick="btnMchoose_Click"
                                        Text="多选题" />--%></td>
                                <td style="width: 114px; height: 21px;">
                                    &nbsp;<asp:Button ID="btnJudge" runat="server" Enabled="False" OnClick="btnJudge_Click"
                                        Text="判断题" /></td>
                                <td style="width: 134px; height: 21px">
                                    <asp:Button ID="btnInput" runat="server" Enabled="False" OnClick="btnInput_Click"
                                        Text="填空题" /></td>
                                <td style="width: 138px; height: 21px;">
                                    <asp:Button ID="btnApplication" runat="server" Enabled="False" OnClick="btnApplication_Click"
                                        Text="应用题" /></td>
                                <td style="height: 21px;">
                                    <asp:Button ID="btnAll" runat="server" Enabled="False" OnClick="btnAll_Click" Text="显示所有考题" /></td>
                            </tr>
                        </table>
                </td>
                <td style="width: 41px; text-align: left; height: 88px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 57px; text-align: left">
                </td>
                <td style="width: 636px; text-align: left">
                    &nbsp;<asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="672px" Height="1497px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                
                
                <table style="width: 632px; height: 171px;">
                    <tr>
                        <td colspan="3"><%# Eval("questionText") %><br />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 21px">
                A:</td>
                        <td style="width: 606px; height: 21px">
                            <asp:Label ID="Label2" runat="server" ><%# Eval("chooseA")%></asp:Label></td>
                        <td style="width: 8px; height: 21px">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 21px">
                B:</td>
                        <td style="width: 606px; height: 21px;">
                            <asp:Label ID="Label3" runat="server" ><%# Eval("chooseB")%></asp:Label></td>
                        <td style="width: 8px; height: 21px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                C:</td>
                        <td style="width: 606px">
                            <asp:Label ID="Label4" runat="server" ><%# Eval("chooseC")%></asp:Label></td>
                        <td style="width: 8px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                D:</td>
                        <td style="width: 606px">
                            <asp:Label ID="Label5" runat="server" ><%# Eval("chooseD")%></asp:Label></td>
                        <td style="width: 8px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 47px">
                <asp:RadioButtonList ID="rbanswer" runat="server" RepeatColumns="4" AutoPostBack="True">
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                </asp:RadioButtonList>
            <asp:Label ID="lblc" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderTemplate>
                一、选择
            </HeaderTemplate>
        </asp:TemplateField>
        </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
                    </asp:Panel>
                </td>
                <td style="width: 41px; text-align: left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 57px; text-align: left">
                </td>
                <td style="width: 636px; text-align: left">
                    &nbsp;<asp:Panel ID="Panel2" runat="server" Height="50px" Width="125px">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="672px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <Columns><asp:TemplateField>
                        <HeaderTemplate>
                            二、判断
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 629px">
                                <tr>
                                    <td colspan="2" rowspan="3" style="width: 470px; height: 23px">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("questionText") %>'></asp:Label></td>
                                    <td rowspan="3" style="height: 23px">
                                        <asp:RadioButtonList ID="rbanswer" runat="server" RepeatColumns="2">
                                            <asp:ListItem>对</asp:ListItem>
                                            <asp:ListItem>错</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:Label ID="lblc" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField></Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="Gainsboro" />
                    </asp:GridView>
                    </asp:Panel>
                </td>
                <td style="width: 41px; text-align: left">
                </td>
            </tr>
            <tr>
                <td style="width: 57px; text-align: left; height: 341px;">
                </td>
                <td style="width: 636px; text-align: left; height: 341px;">
                    <asp:Panel ID="Panel3" runat="server" Height="50px" Width="125px">
                        <asp:GridView ID="GridView3" runat="server" Height="84px" Width="671px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <Columns><asp:TemplateField>
                            <HeaderTemplate>
                                三、填空
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table style="width: 646px; height: 54px">
                                    <tr>
                                        <td colspan="3" rowspan="3">
                                            <asp:Label ID="lbltk" runat="server" Text='<%# Eval("questionText") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td colspan="3" rowspan="1" style="height: 15px">
                                            <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="638px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField></Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td style="width: 41px; text-align: left; height: 341px;">
                </td>
            </tr>
            <tr>
                <td style="width: 57px; text-align: left; height: 814px;">
                </td>
                <td style="width: 636px; text-align: left; height: 814px;">
                    &nbsp;<asp:Panel ID="Panel4" runat="server" Height="50px" Width="125px">
                    <asp:GridView ID="GridView4" runat="server" Height="84px" Width="671px" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    四、简答
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table style="width: 646px; height: 54px">
                                        <tr>
                                            <td colspan="3" rowspan="3">
                                                <asp:Label ID="lbljd" runat="server" Text='<%# Eval("questionText") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>
                                            <td colspan="3" rowspan="1" style="height: 106px">
                                                <asp:TextBox ID="TextBox1" runat="server" Height="113px" TextMode="MultiLine" Width="638px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                    </asp:Panel>
                </td>
                <td style="width: 41px; text-align: left; height: 814px;">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 25px">
                    <asp:Button ID="btnjj" runat="server" OnClick="btnjj_Click" Text="交    卷" Width="101px" Enabled="False" /></td>
            </tr>
        </table>
        <br />
    
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



public partial class Student_text : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=localhost;Initial Catalog=xTest;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_schoose ", conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                string sqlSChoose = "select * from tb_schoose order by ID desc";
                BaseClass.BindDG(GridView1, "ID", sqlSChoose, "tb_schoose");
                //int SChooseNum = Int32.Parse(sdr["SChooseNum"].ToString());
                //int SChoosePoint = Int32.Parse(sdr["SChoosePoint"].ToString());
                ////int MChooseNum = Int32.Parse(sdr["MChooseNum"].ToString());
                ////int MChoosePoint = Int32.Parse(sdr["MChoosePoint"].ToString());
                //int JudgeNum = Int32.Parse(sdr["JudgeNum"].ToString());
                //int JudgePoint = Int32.Parse(sdr["JudgePoint"].ToString());
                //int ApplicationNum = Int32.Parse(sdr["ApplicationNum"].ToString());
                //int InputNum = Int32.Parse(sdr["InputNum"].ToString());
                // string sqlSChoose = "select top " + SChooseNum + " * from tb_schoose order by newid()";
                // //string sqlMChoose = "select top " + MChooseNum + " * from tb_mchoose order by newid()";
                // string sqlJudge = "select top " + JudgeNum + " * from tb_judge order by newid()";
                // string sqlInput = "select top " + InputNum + " * from tb_input order by newid()";
                // string sqlApplication = "select top " + ApplicationNum + " * from tb_application order by newid()";
                // BaseClass.BindDG(GridView1, "ID", sqlSChoose, "tb_schoose");

                // BaseClass.BindDG(GridView2, "ID", sqlJudge, "tb_judge");
                // BaseClass.BindDG(GridView3, "ID", sqlInput, "tb_input");
                // BaseClass.BindDG(GridView4, "ID", sqlApplication, "tb_application");
            }
            conn.Close();
            conn.Open();
            SqlCommand cmdjudge = new SqlCommand("select * from tb_judge", conn);
            SqlDataReader sdrjudge = cmdjudge.ExecuteReader();
            while (sdrjudge.Read())
            {
                string strjudge = "select * from tb_judge";
                BaseClass.BindDG(GridView2, "ID", strjudge, "tb_judge");

            }
            conn.Close();
            conn.Open();
            SqlCommand cmdinput = new SqlCommand("select * from tb_input", conn);
            SqlDataReader sdrinput = cmdinput.ExecuteReader();
            while (sdrinput.Read())
            {
                string strinput = "select * from tb_input";
                BaseClass.BindDG(GridView3, "ID", strinput, "tb_input");
            }
            conn.Close();
            conn.Open();
            SqlCommand cmdquestion = new SqlCommand("select * from tb_application",conn);
            SqlDataReader sdrquestion = cmdquestion.ExecuteReader();
            while (sdrquestion.Read())
            {
                string strquestion = "select * from tb_application";
                BaseClass.BindDG(GridView4, "ID", strquestion, "tb_input");
            }
            conn.Close();
        }
        }

    protected void  btnjj_Click(object sender, EventArgs e)
    {
        string sql = "select answer from tb_schoose ";
                    SqlDataAdapter dataAdapter=new SqlDataAdapter(sql,conn);
                    DataSet dataset=new DataSet();
                    dataAdapter.Fill(dataset,"tb_schoose");
                    DataTable datatable = dataset.Tables["tb_schoose"];
                    int c = 0;//存答正确答案
                for (int a = 0; a < GridView1.Rows.Count; a++)
                {

                   RadioButtonList rbl = (RadioButtonList)(GridView1.Rows[a].FindControl("rbanswer"));//取用户所选答案
                   Label lblc = (Label)(GridView1.Rows[a].FindControl("lblc"));
                    if (rbl != null && rbl.SelectedValue != "")
                    {

                  string answer =datatable.Rows[a]["answer"].ToString().Trim();//取正确答案

                    if (rbl.SelectedValue.ToString().Trim() == answer)//比较
                    {
                        c = c + 1;
                        lblc.Text = "回答正确";
                    }
                    else
                    {
                        lblc.Text = "回答错";
                    }
                    }

                }
                btnjj.Enabled = false;//交完一次就不能在交
                string sdrsql = "select answer from tb_judge ";
                SqlDataAdapter da = new SqlDataAdapter(sdrsql, conn);
                DataSet ds = new DataSet();
                da.Fill(dataset, "tb_judge");
                DataTable dt = dataset.Tables["tb_judge"];
                int n = 0;//存答正确答案
                for (int a = 0; a < GridView1.Rows.Count; a++)
                {

                    RadioButtonList rbl = (RadioButtonList)(GridView1.Rows[a].FindControl("rbanswer"));//取用户所选答案
                    Label lblc = (Label)(GridView1.Rows[a].FindControl("lblc"));
                    if (rbl != null && rbl.SelectedValue != "")
                    {

                        string answer = datatable.Rows[a]["answer"].ToString().Trim();//取正确答案

                        if (rbl.SelectedValue.ToString().Trim() == answer)//比较
                        {
                            n = n + 1;
                            lblc.Text = "回答正确";
                        }
                        else
                        {
                            lblc.Text = "回答错";
                        }
                    }

                }
                btnjj.Enabled = false;//交完一次就不能在交
                Response.Write("<script>alert('一共" + "  回答正确  " + "题你答对了" + c + "题');</script>");

            }
    protected void btnstart_Click(object sender, EventArgs e)
    {
      
        btnstart.Enabled = false;
        btnSchoose.Enabled = true;
        
        btnJudge.Enabled = true;
        btnInput.Enabled = true;
        btnApplication.Enabled = true;
        btnAll.Enabled = true;
        btnjj.Enabled = true;
    }
    protected void btnSchoose_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
      
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
    }
   
    protected void btnJudge_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
     
        Panel2.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = false;
    }
    protected void btnInput_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
       
        Panel2.Visible = false;
        Panel3.Visible = true;
        Panel4.Visible = false;
    }
    protected void btnApplication_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
     
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = true;
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        Panel1 .Visible = true;
      
        Panel2.Visible = true;
        Panel3.Visible = true;
        Panel4.Visible = true;
    }
}



   
