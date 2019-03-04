using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Categories
/// </summary>
public class Categories
{
    public List<Category> SearchCategories()
    {
        List<Category> CategoryList = new List<Category>();

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand getCategoriesCMD = new SqlCommand()
        {
            CommandText = "GetCategories",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlDataReader getCategoriesReader = getCategoriesCMD.ExecuteReader();

        if (getCategoriesReader.HasRows)
        {
            while (getCategoriesReader.Read())
            {
                Category currentCategory = new Category() {

                    CategoryID = int.Parse(getCategoriesReader["CategoryID"].ToString()),
                    Name = getCategoriesReader["CategoryName"].ToString(),
                    Description = getCategoriesReader["Description"].ToString()
                };

                CategoryList.Add(currentCategory);
            }
        }

        return CategoryList;
    }
}