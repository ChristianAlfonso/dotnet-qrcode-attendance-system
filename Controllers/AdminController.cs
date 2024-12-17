using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using static System.Collections.Specialized.BitVector32;
namespace sis.Controllers
{
    public class AdminController : Controller
    {
        private string connectionString = "Server=localhost;Database=sis;Uid=root;Pwd=;";
        public ActionResult AdminHomePage()
        {
            var studentList = new List<Dictionary<string, string>>();
            var facultyList = new List<Dictionary<string, string>>();
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM student", conn))
                {
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
                            studentList.Add(student);
                        }
                    }
                }
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM faculty", conn))
                {
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
                            facultyList.Add(faculty);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            ViewBag.StudentList = studentList;
            ViewBag.FacultyList = facultyList;
            ViewBag.StudentCount = studentList.Count;
            ViewBag.FacultyCount = facultyList.Count;
            return View();
        }

        public ActionResult GetImagePath()
        {
            var imgPath = Url.Content("~/img/qcuLogo.jpg");
            return Content(imgPath);

        }
        [HttpPost]
        public ActionResult AddStudent(string student_no, string firstName, string middleName, string surName, string password, string section, string age, string email, string qrCodeData)
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            try
            {
                using (MySqlCommand cmdinsert = new MySqlCommand("INSERT INTO student (student_no, first_name, last_name, middle_name, password, section, age, email_address, qr_code, created_At) VALUES (@student_no, @first_name, @last_name, @middle_name, @password, @section, @age, @email_address, @qr_code, @created_At)", conn))
                {
                    cmdinsert.Parameters.AddWithValue("@student_no", student_no);
                    cmdinsert.Parameters.AddWithValue("@first_name", firstName);
                    cmdinsert.Parameters.AddWithValue("@last_name", surName);
                    cmdinsert.Parameters.AddWithValue("@middle_name", middleName);
                    cmdinsert.Parameters.AddWithValue("@password", password);
                    cmdinsert.Parameters.AddWithValue("@section", section);
                    cmdinsert.Parameters.AddWithValue("@age", age);
                    cmdinsert.Parameters.AddWithValue("@email_address", email);
                    cmdinsert.Parameters.AddWithValue("@qr_code", qrCodeData);
                    cmdinsert.Parameters.AddWithValue("@created_At", DateTime.Now);
                    cmdinsert.ExecuteNonQuery();
                    Session["message"] = "Student Registered";
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
                Debug.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }


            return RedirectToAction("AdminHomePage");
        }
        [HttpPost]
        
        public ActionResult AddFaculty(string id, string firstName, string middleName, string surName, string age,string subject, string email, string password)
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM faculty WHERE id = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            Session["facultyMessageFailed"] = "Faculty already exists";
                            Response.RedirectToRoute("AdminHomePage");
                        }
                    }
                }

                using (MySqlCommand cmdinsert = new MySqlCommand("INSERT INTO faculty (id, first_name, last_name, middle_name, age, email_address,password,subject, created_At) VALUES (@id, @first_name, @last_name, @middle_name, @age, @email_address,@password,@subject, @created_At)", conn))
                {
                    cmdinsert.Parameters.AddWithValue("@id", id);
                    cmdinsert.Parameters.AddWithValue("@first_name", firstName);
                    cmdinsert.Parameters.AddWithValue("@last_name", surName);
                    cmdinsert.Parameters.AddWithValue("@middle_name", middleName);
                    cmdinsert.Parameters.AddWithValue("@age", age);
                    cmdinsert.Parameters.AddWithValue("@email_address", email);
                    cmdinsert.Parameters.AddWithValue("@password", password);
                    cmdinsert.Parameters.AddWithValue("@subject", subject);
                    cmdinsert.Parameters.AddWithValue("@created_At", DateTime.Now);
                    cmdinsert.ExecuteNonQuery();
                    Session["facultyMessageSuccess"] = "Faculty Added Successfully";
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
                Debug.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return RedirectToAction("AdminHomePage");

        }

    }
}