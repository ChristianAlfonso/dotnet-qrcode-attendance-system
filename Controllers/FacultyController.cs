using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
namespace sis.Controllers
{
    public class FacultyController : Controller
    {
        private readonly string connectionString = "Server=localhost;Database=sis;Uid=root;Pwd=;";   
        string currentSubject;
        // GET: Faculty
        public ActionResult FacultyPage()
        {
            if (Session["FacultyNo"] == null)
            {
                return RedirectToAction("LoginPage", "Login");
            }
            MySqlConnection conn = new MySqlConnection(connectionString);
            var facultyNo = Session["FacultyNo"].ToString();
            var facultyInfo = new List<Dictionary<string, string>>();
            conn.Open();
            using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM faculty WHERE id = @id", conn))
            {
                cmd.Parameters.AddWithValue("@id", facultyNo);
                cmd.ExecuteNonQuery();
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var faculty = new Dictionary<string, string>();
                        faculty.Add("id", reader["id"].ToString());
                        faculty.Add("first_name", reader["first_name"].ToString());
                        faculty.Add("last_name", reader["last_name"].ToString());
                        faculty.Add("middle_name", reader["middle_name"].ToString());
                        faculty.Add("age", reader["age"].ToString());
                        faculty.Add("email_address", reader["email_address"].ToString());
                        faculty.Add("subject", reader["subject"].ToString());
                        facultyInfo.Add(faculty);
                        ViewBag.FacultyInfo = facultyInfo;
                       currentSubject = reader["subject"].ToString();
                        ViewBag.CurrentSubject = reader["subject"].ToString();
                    }
                }
            }
            using(MySqlCommand cmd = new MySqlCommand("SELECT * FROM attendance WHERE subject = @subject", conn))
            {
                cmd.Parameters.AddWithValue("@subject", currentSubject);
                cmd.ExecuteNonQuery();
                var attendanceList = new List<Dictionary<string, string>>();
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var attendance = new Dictionary<string, string>();
                        attendance.Add("student_no", reader["student_no"].ToString());
                        attendance.Add("student_first_name", reader["student_first_name"].ToString());
                        attendance.Add("student_last_name", reader["student_last_name"].ToString());
                        attendance.Add("student_middle_initial", reader["student_middle_initial"].ToString());
                        attendance.Add("subject", reader["subject"].ToString());
                        attendance.Add("time_of_attendance", reader["time_of_attendance"].ToString());
                        attendanceList.Add(attendance);
                        ViewBag.AttendanceList = attendanceList;

                    }
                }
            }
            return View();
        }

        public ActionResult InsertAttendance(string student_no,string student_first_name, string student_last_name,string student_middle_initial, string subject)
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            using (MySqlCommand cmd = new MySqlCommand("INSERT INTO attendance (student_no, student_first_name, student_last_name, student_middle_initial, subject) VALUES (@student_no, @student_first_name, @student_last_name,@student_middle_initial, @subject)", conn))
            {
                cmd.Parameters.AddWithValue("@student_no", student_no);
                cmd.Parameters.AddWithValue("@student_first_name", student_first_name);
                cmd.Parameters.AddWithValue("@student_last_name", student_last_name);
                cmd.Parameters.AddWithValue("@student_middle_initial", student_middle_initial);
                cmd.Parameters.AddWithValue("@subject", subject);
                cmd.ExecuteNonQuery();
            }
          return  RedirectToAction("FacultyPage", "Faculty");

        }
    }
}