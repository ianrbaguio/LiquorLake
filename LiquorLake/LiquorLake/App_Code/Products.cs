using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Products
/// </summary>
public class Products
{
    public List<Product> GetProducts()
    {
        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand getProductsCmd = new SqlCommand()
        {
            CommandText = "GetProducts",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlDataReader productsReader = getProductsCmd.ExecuteReader();

        List<Product> products = new List<Product>();

        while (productsReader.Read())
        {
            Product currentProduct = new Product()
            {
                UPC = productsReader["UPC"].ToString(),
                CategoryID = (int)productsReader["CategoryID"],
                Company = productsReader["Company"].ToString(),
                Price = (decimal)productsReader["Price"],
                CountryOfOrigin = productsReader["CountryOfOrigin"].ToString(),
                Description = productsReader["Description"].ToString(),
                ImageUrl = "~/App_Themes/Catalog/Images/liquor_placeholder.png",
                Name = productsReader["Name"].ToString(),
                Size = (int)productsReader["Size"],
                WineSweetnessIndex = productsReader["WineSweetnessIndex"].ToString()
            };

            products.Add(currentProduct);
        }

        productsReader.Close();

        liquorLakeConn.Close();

        return products;

    }
}