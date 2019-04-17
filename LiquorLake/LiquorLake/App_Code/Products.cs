using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FluentFTP;
using System.Net;

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
            currentProduct.CategoryName = productsReader["CategoryName"].ToString();
            currentProduct.Company = productsReader["Company"].ToString();
            currentProduct.Price = (decimal)productsReader["Price"];
            currentProduct.CountryOfOrigin = productsReader["CountryOfOrigin"].ToString();
            currentProduct.Description = productsReader["Description"].ToString();
            currentProduct.ImageUrl = productsReader["Image"].ToString(); ;
            currentProduct.Name = productsReader["Name"].ToString();
            currentProduct.Size = int.Parse(productsReader["Size"].ToString());
            currentProduct.WineSweetnessIndex = productsReader["WineSweetnessIndex"].ToString();

            products.Add(currentProduct);
        }

        productsReader.Close();

        liquorLakeConn.Close();

        return products;
    }

    public Product GetProductDetails(string upc)
    {
        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand GetProductDetailsCMD = new SqlCommand()
        {
            CommandText = "ProductDetails",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter UPCParameter = new SqlParameter()
        {
            ParameterName = "@UPC",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = upc,
            Direction = ParameterDirection.Input
        };

        GetProductDetailsCMD.Parameters.Add(UPCParameter);

        SqlDataReader GetProductDetailsReader = GetProductDetailsCMD.ExecuteReader();

        Product returnProduct = new Product();
        if (GetProductDetailsReader.HasRows)
        {
            GetProductDetailsReader.Read();

            returnProduct.UPC = GetProductDetailsReader["UPC"].ToString();
            returnProduct.CategoryID = int.Parse(GetProductDetailsReader["CategoryID"].ToString());
            returnProduct.CategoryName = GetProductDetailsReader["CategoryName"].ToString();
            returnProduct.Company = GetProductDetailsReader["Company"].ToString();
            returnProduct.Price = (decimal)GetProductDetailsReader["Price"];
            returnProduct.CountryOfOrigin = GetProductDetailsReader["CountryOfOrigin"].ToString();
            returnProduct.Description = GetProductDetailsReader["Description"].ToString();
            returnProduct.ImageUrl = GetProductDetailsReader["Image"].ToString();
            returnProduct.Name = GetProductDetailsReader["Name"].ToString();
            returnProduct.Size = int.Parse(GetProductDetailsReader["Size"].ToString());
            returnProduct.WineSweetnessIndex = GetProductDetailsReader["WineSweetnessIndex"].ToString();
        }

        return returnProduct;
    }

    public bool DeleteProduct(string upc)
    {
        bool success = false;

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand GetProductDetailsCMD = new SqlCommand()
        {
            CommandText = "DeleteProduct",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter UPCParameter = new SqlParameter()
        {
            ParameterName = "@UPC",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = upc,
            Direction = ParameterDirection.Input
        };

        GetProductDetailsCMD.Parameters.Add(UPCParameter);

        GetProductDetailsCMD.ExecuteNonQuery();

        success = true;

        return success;
    }

    public bool UpdateProduct(Product p )
    {
        bool success = false;

        //Add image to FTP
        FtpClient clientFTP = new FtpClient("www.liquorlake.com");

        //FTP credentials
        clientFTP.Credentials = new NetworkCredential("raybains", "PsiStorm1");

        clientFTP.Connect();

        clientFTP.RetryAttempts = 3;
        clientFTP.UploadFile(p.ImageUrl, "/httpdocs/Images/" + p.CategoryName + "/" + p.ImageUrl);

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand UpdateProductCMD = new SqlCommand()
        {
            CommandText = "UpdateProduct",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter updateParameter = new SqlParameter()
        {
            ParameterName = "@UPC",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.UPC,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@CategoryID",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.CategoryID,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@Name",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Name,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@Price",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Price,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@Size",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Size,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@CountryOfOrigin",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.CountryOfOrigin,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@WineSweetnessIndex",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.WineSweetnessIndex,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@Image",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.ImageUrl,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        updateParameter = new SqlParameter()
        {
            ParameterName = "@Company",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Company,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);


        updateParameter = new SqlParameter()
        {
            ParameterName = "@Description",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Description,
            Direction = ParameterDirection.Input
        };

        UpdateProductCMD.Parameters.Add(updateParameter);

        UpdateProductCMD.ExecuteNonQuery();

        success = true;

        return success;
        
    }

    public bool AddProduct(Product p, string imageName)
    {
        bool success = false;
        string categoryName = p.CategoryName;

        //Add image to FTP
        FtpClient clientFTP = new FtpClient("www.liquorlake.com");

        //FTP credentials
        clientFTP.Credentials = new NetworkCredential("raybains", "PsiStorm1");

        clientFTP.Connect();

        clientFTP.RetryAttempts = 3;
        clientFTP.UploadFile(p.ImageUrl, "/httpdocs/Images/" + categoryName + "/" + imageName);

        p.ImageUrl = imageName;

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand addProductCMD = new SqlCommand()
        {
            CommandText = "AddProduct",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter addProductParam = new SqlParameter()
        {
            ParameterName = "@UPC",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.UPC,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@CategoryID",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.CategoryID,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Name",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Name,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Price",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Price,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Size",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Size,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@CountryOfOrigin",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.CountryOfOrigin,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@WineSweetnessIndex",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.WineSweetnessIndex,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Image",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.ImageUrl,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Company",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Company,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductParam = new SqlParameter()
        {
            ParameterName = "@Description",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = p.Description,
            Direction = ParameterDirection.Input
        };

        addProductCMD.Parameters.Add(addProductParam);

        addProductCMD.ExecuteNonQuery();

        success = true;

        return success;

    }
}