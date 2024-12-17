using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
namespace sis.Controllers
{
    public class LoginController : Controller
    {
        private string connectionString = "Server=localhost;Database=sis;Uid=root;Pwd=;";
        public ActionResult LoginPage()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginStudent(string student_no, string password)
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM student WHERE student_no = @student_no AND password = @password", conn))
                {
                    cmd.Parameters.AddWithValue("@student_no", student_no);
                    cmd.Parameters.AddWithValue("@password", password);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Login successful
                            Session["StudentNo"] = student_no;
                            return RedirectToAction("StudentPage", "Student");
                        }
                        else
                        {
                            // Login failed
                            ViewBag.Message = "Invalid number or password.";
                            return View("LoginPage");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
                return View("LoginPage");
            }
            finally
            {
                conn.Close();
            }
        }
        [HttpPost]
        public ActionResult FacultyLogin(string id, string password)
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM faculty WHERE id = @id AND password = @password", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@password", password);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Login successful
                            Session["FacultyNo"] = id;
                            return RedirectToAction("FacultyPage", "Faculty");
                        }
                        else
                        {
                            // Login failed
                            ViewBag.Message = "Invalid number or password.";
                            return View("LoginPage");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
                return View("LoginPage");
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
