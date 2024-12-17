using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
namespace sis.Controllers
{
    public class StudentController : Controller
    {
        private string connectionString = "Server=localhost;Database=sis;Uid=root;Pwd=;";
        // GET: Student
        public ActionResult StudentPage()
        {
            if (Session["StudentNo"] == null)
            {
                return RedirectToAction("LoginPage", "Login");
            }
            MySqlConnection conn = new MySqlConnection(connectionString);
            var studentNo = Session["StudentNo"].ToString();
           var StudentInfo = new List<Dictionary<string, string>>();
            conn.Open();
          
            using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM student WHERE student_no = @student_no", conn))
            {
                cmd.Parameters.AddWithValue("@student_no", studentNo);
                cmd.ExecuteNonQuery();

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var student = new Dictionary<string, string>();

                        student.Add("student_no", reader["student_no"].ToString());
                        student.Add("first_name", reader["first_name"].ToString());
                        student.Add("last_name", reader["last_name"].ToString());
                        student.Add("middle_name", reader["middle_name"].ToString());
                        student.Add("section", reader["section"].ToString());
                        student.Add("age", reader["age"].ToString());
                        student.Add("email_address", reader["email_address"].ToString());
                        student.Add("qr_code", reader["qr_code"].ToString());
                        StudentInfo.Add(student);

                    }
                }
            }
            ViewBag.StudentInfo = StudentInfo;

            return View();
        }
    }
}