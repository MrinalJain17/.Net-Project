using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ResearchHub
{
    public class MiddleWare
    {
        private String connectionString = "Server=localhost;Uid=root;Pwd=Mrinal17;Database=research_hub_database";
        public int login(String email, String password, Boolean researcher=true)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query;
                if (researcher)
                    query = String.Format("SELECT email, password FROM researcher_login WHERE email=\'{0}\'", email);
                else
                    query = String.Format("SELECT email, password FROM guide_login WHERE email=\'{0}\'", email);

                conn.ConnectionString = connectionString;
                conn.Open();

                MySqlCommand command = new MySqlCommand(query, conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (String.Equals(password, reader[1].ToString()))
                                return 1;
                            else
                                return 0;
                        }
                    }
                    else
                        return -1;
                }
            }
            return -1;                               // Error in connection
        }
        public int sign_up(String name, String email, String password, String phone, Boolean researcher=true)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query;
                if (researcher)
                    query = String.Format("INSERT INTO researcher_profile (name, email, phone_no, is_image) VALUES (\'{0}\', \'{1}\', \'{2}\', \'{3}\')", name, email, phone, 0);
                else
                    query = String.Format("INSERT INTO guide_profile (name, email, phone_no, is_image) VALUES (\'{0}\', \'{1}\', \'{2}\', \'{3}\')", name, email, phone, 0);

                conn.ConnectionString = connectionString;
                conn.Open();

                MySqlCommand command = new MySqlCommand(query, conn);
                try
                {
                    int rows_affected = command.ExecuteNonQuery();
                    if (rows_affected == 1)
                    {
                        String query2;
                        if (researcher)
                            query2 = String.Format("INSERT INTO researcher_login (email, password) VALUES (\'{0}\', \'{1}\')", email, password);
                        else
                            query2 = String.Format("INSERT INTO guide_login (email, password) VALUES (\'{0}\', \'{1}\')", email, password);
                        MySqlCommand command2 = new MySqlCommand(query2, conn);
                        try
                        {
                            int rows_affected2 = command2.ExecuteNonQuery();
                            if (rows_affected2 == 1)
                                return 1;
                        }
                        catch(Exception)
                        {
                            Console.WriteLine("User details inserted, but some error occured !");
                            return -1;
                        }
                    }
                }
                catch(Exception)
                {
                    Console.WriteLine("User details could not be inserted !");
                    return 0;
                }
            }
            return -1;                                    // Error in connection
        }
        public String get_name(String email, Boolean researcher=true)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query;
                if (researcher)
                    query = String.Format("SELECT name FROM researcher_profile WHERE email=\'{0}\'", email);
                else
                    query = String.Format("SELECT name FROM guide_profile WHERE email=\'{0}\'", email);

                conn.ConnectionString = connectionString;
                conn.Open();

                MySqlCommand command = new MySqlCommand(query, conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                        while (reader.Read())
                            return reader[0].ToString();
                }
            }
            return "";                          // Error in connection
        }
        public int check_image(String email, Boolean researcher=true)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query;
                if (researcher)
                    query = String.Format("SELECT is_image FROM researcher_profile WHERE email=\'{0}\'", email);
                else
                    query = String.Format("SELECT is_image FROM guide_profile WHERE email=\'{0}\'", email);

                conn.ConnectionString = connectionString;
                conn.Open();

                MySqlCommand command = new MySqlCommand(query, conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (reader[0].ToString() == "1")
                                return 1;
                            else
                                return 0;
                        }
                    }          
                }
            }
            return -1;                                  // Error in connection
        }
        public String find_guides()
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query = "SELECT name, email, phone_no FROM guide_profile";
                String result= "<div class=\"w3-container w3-margin\">";
                conn.ConnectionString = connectionString;
                conn.Open();
                MySqlCommand command = new MySqlCommand(query, conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            String temp = "<div class=\"w3-card-4\" style=\"width:50%\">" + 
                                "<div class=\"w3-container w3-center\">" +
                                "<h3> {0} </h3>" +
                                "<div class=\"w3-section\">" +
                                "<h5> Phone: {1} </h5>" +
                                "</div>" +
                                "<div class=\"w3-section\">" +
                                "<h5> Email: {2} </h5>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "<br />";
                            result += String.Format(temp, reader[0], reader[2], reader[1], reader[1]);
                        }
                        
                    }
                    return result + "</div>";
                }
            }
        }
        public int selected_guide(String guide_id, String researcher_id)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                int check = update_guide(researcher_id);
                String query = String.Format("UPDATE researcher_under_guide SET guide_id=\'{0}\' WHERE researcher_id=\'{1}\'", guide_id, researcher_id);
                if (check == 0)
                    query = String.Format("INSERT INTO researcher_under_guide (researcher_id, guide_id) VALUES (\'{0}\', \'{1}\')", researcher_id, guide_id);
                conn.ConnectionString = connectionString;
                conn.Open();

                MySqlCommand command = new MySqlCommand(query, conn);
                try
                {
                    int rows_affected = command.ExecuteNonQuery();
                    if (rows_affected == 1)
                        return 1;
                }
                catch(Exception)
                {
                    Console.WriteLine("Details could not be inserted !");
                    return 0;
                }
            }
            return -1;                              // Error in connection
        }
        public int update_guide(String researcher_id)
        {
            using (MySqlConnection conn = new MySqlConnection())
            {
                String query = String.Format("SELECT researcher_id FROM researcher_under_guide WHERE researcher_id=\'{0}\'", researcher_id);
                conn.ConnectionString = connectionString;
                conn.Open();
                MySqlCommand command = new MySqlCommand(query, conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                        return 1;
                    else
                        return 0;
                }
            }
        }
    }
}