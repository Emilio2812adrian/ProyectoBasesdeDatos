using MySql.Data.MySqlClient;
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
using System.Data.SqlClient;

namespace ProyectoBasesdeDatos
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();

        }

        private void BotonAceptar_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            logear();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_Enter(object sender, EventArgs e)
        {
            if (textBox2.Text == "USUARIO")
            {
                textBox2.Text = "";
                textBox2.ForeColor = Color.LightGray;
            }
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            if (textBox2.Text == "")
            {
                textBox2.Text = "USUARIO";
                textBox2.ForeColor = Color.DimGray;
            }

        }

        private void textBox1_Enter(object sender, EventArgs e)
        {
            if (textBox1.Text == "CONTRASEÑA")
            {
                textBox1.Text = "";
                textBox1.ForeColor = Color.LightGray;
                textBox1.UseSystemPasswordChar = true;
            }
        }

        private void textBox1_Leave(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                textBox1.Text = "CONTRASEÑA";
                textBox1.ForeColor = Color.DimGray;
                textBox1.UseSystemPasswordChar = false;
            }
        }
        //Realizar la conexión a la base de datos
        SqlConnection conexion = new SqlConnection("server=DESKTOP-3VU8KAK\\SQLEXPRESS;database=CConvenciones; integrated security=true");

        public void logear()
        {
            try
            {
                conexion.Open();  //Hacer la conexión a la base de datos
                string consulta = "select * from Roll"; //Recoger los datos que se ingresan en los TextBox
                SqlCommand comando = new SqlCommand(consulta, conexion);
                SqlDataReader lector;
                DataTable dt = new DataTable();
                lector = comando.ExecuteReader();
                dt.Load(lector);

                dataGridView1.DataSource = dt;

                //if (dt.Rows.Count == 1)
                //{

                //    this.Hide();
                //    if ((dt.Rows[0][1].ToString() == usuario) && (dt.Rows[0][2].ToString()==contraseña))
                //    {
                //        MessageBox.Show("si entro");
                //        Digitador digitador = new Digitador();
                //        digitador.Show();
                //    }
                //    else if (dt.Rows[0][1].ToString() == "Dig")
                //    {
                //        Digitador digitador = new Digitador();
                //        digitador.Show();
                //    }
                //}
                //else
                //{
                //    MessageBox.Show("usuario o contraseña invalidos");
                //}
                conexion.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            finally
            {

            }
        }



        private void button1_Click(object sender, EventArgs e)
        {

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells[1].Value != null && row.Cells[2].Value != null && row.Cells[3].Value != null)
                {
                    if (row.Cells[1].Value.ToString() == textBox2.Text && row.Cells[2].Value.ToString() == textBox1.Text)
                    {
                        if (row.Cells[3].Value.ToString() == "Admin")
                        {
                            this.Hide();
                            Administrador administrador = new Administrador();
                            administrador.Show();
                            return;
                        }
                        else if (row.Cells[3].Value.ToString() == "Dig")
                        {
                            this.Hide();
                            Digitador digitador = new Digitador();
                            digitador.Show();
                            return;
                        }
                    }
                }
            }
            MessageBox.Show("Credenciales inválidas");
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells[1].Value != null && row.Cells[2].Value != null && row.Cells[3].Value != null)
                {
                    if (row.Cells[1].Value.ToString() == textBox2.Text && row.Cells[2].Value.ToString() == textBox1.Text)
                    {
                        if (row.Cells[3].Value.ToString() == "Admin")
                        {
                            this.Hide();
                            Administrador administrador = new Administrador();
                            administrador.Show();
                            return;
                        }
                        else if (row.Cells[3].Value.ToString() == "Dig")
                        {
                            this.Hide();
                            Digitador digitador = new Digitador();
                            digitador.Show();
                            return;
                        }
                    }
                }
            }
            MessageBox.Show("Credenciales inválidas");

        }
    }
}