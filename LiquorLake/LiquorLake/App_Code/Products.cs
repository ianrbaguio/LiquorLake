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
    public List<Product> GetProducts(int categoryid = 0)
    {
        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand getProductsCmd = new SqlCommand()
        {
            CommandText = "GetProducts",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter categoryIDParameter = new SqlParameter()
        {
            ParameterName = "@CategoryID",
            SqlValue = categoryid,
            SqlDbType = SqlDbType.Int,
            Direction = ParameterDirection.Input
        };

        getProductsCmd.Parameters.Add(categoryIDParameter);

        SqlDataReader productsReader = getProductsCmd.ExecuteReader();

        List<Product> products = new List<Product>();

        while (productsReader.Read())
        {
            //Product currentProduct = new Product()
            //{
            //    UPC = productsReader["UPC"].ToString(),
            //    CategoryID = int.Parse(productsReader["CategoryID"].ToString()),
            //    Company = productsReader["Company"].ToString(),
            //    Price = (decimal)productsReader["Price"],
            //    CountryOfOrigin = productsReader["CountryOfOrigin"].ToString(),
            //    Description = productsReader["Description"].ToString(),
            //    ImageUrl = "~/App_Themes/Catalog/Images/liquor_placeholder.png",
            //    Name = productsReader["Name"].ToString(),
            //    Size = int.Parse(productsReader["Size"].ToString()),
            //    WineSweetnessIndex = productsReader["WineSweetnessIndex"].ToString()
            //};

            Product currentProduct = new Product();

            currentProduct.UPC = productsReader["UPC"].ToString();
            currentProduct.CategoryID = int.Parse(productsReader["CategoryID"].ToString());
            currentProduct.CategoryName = productsReader["CategoryName"].ToString();
            currentProduct.Company = productsReader["Company"].ToString();
            currentProduct.Price = (decimal)productsReader["Price"];
            currentProduct.CountryOfOrigin = productsReader["CountryOfOrigin"].ToString();
            currentProduct.Description = productsReader["Description"].ToString();
            currentProduct.ImageUrl = productsReader["Image"].ToString();
            currentProduct.Name = productsReader["Name"].ToString();
            currentProduct.Size = int.Parse(productsReader["Size"].ToString());
            currentProduct.WineSweetnessIndex = productsReader["WineSweetnessIndex"].ToString();

            products.Add(currentProduct);
        }

        productsReader.Close();

        liquorLakeConn.Close();

        return products;

    }
    
    public List<Product> SearchProduct(string keyword)
    {
        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand searchProductsCmd = new SqlCommand()
        {
            CommandText = "SearchProducts",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter productKeywordParam = new SqlParameter()
        {
            ParameterName = "@Keyword",
            SqlValue = keyword,
            SqlDbType = SqlDbType.VarChar,
            Direction = ParameterDirection.Input
        };

        searchProductsCmd.Parameters.Add(productKeywordParam);

        SqlDataReader productsReader = searchProductsCmd.ExecuteReader();

        List<Product> products = new List<Product>();

        while (productsReader.Read())
        {
            Product currentProduct = new Product();

            currentProduct.UPC = productsReader["UPC"].ToString();
            currentProduct.CategoryID = int.Parse(productsReader["CategoryID"].ToString());
            currentProduct.Company = productsReader["Company"].ToString();
            currentProduct.Price = (decimal)productsReader["Price"];
            currentProduct.CountryOfOrigin = productsReader["CountryOfOrigin"].ToString();
            currentProduct.Description = productsReader["Description"].ToString();
            currentProduct.ImageUrl = "~/App_Themes/Catalog/Images/liquor_placeholder.png";
            currentProduct.Name = productsReader["Name"].ToString();
            currentProduct.Size = int.Parse(productsReader["Size"].ToString());
            currentProduct.WineSweetnessIndex = productsReader["WineSweetnessIndex"].ToString();

            products.Add(currentProduct);
        }

        productsReader.Close();

        liquorLakeConn.Close();

        return products;
    }
}