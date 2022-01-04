using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Employee_Management_System
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-HNVPS1T;Initial Catalog=kuhdse202f018;Integrated Security=True");
        private void button1_Click(object sender, EventArgs e)
        {
            int emId = int.Parse(txtEmId.Text);
            string emName = txtEmName.Text, city = txtEmCity.Text, contact = txtCon.Text, sex = "";
            double age = double.Parse(txtEmAge.Text);
            DateTime date = DateTime.Parse(txtDate.Text);
            if (rbtnMale.Checked == true) { sex = "Male"; } else { sex = "Female"; }
            con.Open();
            SqlCommand c = new SqlCommand("exec InsertEmp '" + emId + "','" + emName + "','" + city + "','" + age + "','" + sex + "','" + date + "','" + contact + "'", con);
            c.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully inserted....");
            GetEmpList();

        }
        void GetEmpList()
        {
            SqlCommand c = new SqlCommand("exec ListEmp", con);
            SqlDataAdapter sd = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            GetEmpList();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            //update
            int emId = int.Parse(txtEmId.Text);
            string emName = txtEmName.Text, city = txtEmCity.Text, contact = txtCon.Text, sex = "";
            double age = double.Parse(txtEmAge.Text);
            DateTime date = DateTime.Parse(txtDate.Text);
            if (rbtnMale.Checked == true) { sex = "Male"; } else { sex = "Female"; }
            con.Open();
            SqlCommand c = new SqlCommand("exec UpdateEmp '" + emId + "','" + emName + "','" + city + "','" + age + "','" + sex + "','" + date + "','" + contact + "'", con);
            c.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully Updated....");
            GetEmpList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //delete
            if (MessageBox.Show("Are you sure to delete", "Delete Document", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {


                int emId = int.Parse(txtEmId.Text);
                con.Open();
                SqlCommand c = new SqlCommand("exec DeleteEmp '" + emId + "'", con);
                c.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Successfully Delete....");
                GetEmpList();
            }
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            //load specific employee
            int emId = int.Parse(txtEmId.Text);
            SqlCommand c = new SqlCommand("exec LoadEmp '" + emId + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtEmId.Clear();
            txtCon.Clear();
            txtDate.CustomFormat = "";
            txtEmName.Clear();
            txtEmCity.SelectedIndex = -1;
            txtEmAge.Clear();
            rbtnFemale.Checked = false;
            rbtnMale.Checked = false;
        }
    }
}
