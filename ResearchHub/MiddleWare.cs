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
    }
}