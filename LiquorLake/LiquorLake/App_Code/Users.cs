using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{
    //reference: https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff649202(v=pandp.10)
    public string CreateSalt(int size)
    {
        //Generates a cryptographic random number using the cryptographic
        //service provider
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buffer = new byte[size];
        rng.GetBytes(buffer);
        // Return a Base64 string representation of the random number
        return Convert.ToBase64String(buffer);

    }

    public string CreatePasswordHash(string password, string salt)
    {
        string saltAndPassword = String.Concat(password, salt);
        string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPassword, "SHA1");

        hashedPassword = String.Concat(hashedPassword, salt);
        return hashedPassword;
    }

    public bool StoreAccountDetails(string username, string passwordHash, string salt)
    {
        bool Success = false;

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand RegisterUserCMD = new SqlCommand() {
            CommandText = "RegisterUser",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter UsernameParameter = new SqlParameter()
        {
            ParameterName = "@Username",
            SqlValue = username,
            SqlDbType = SqlDbType.VarChar,
            Direction = ParameterDirection.Input
        };

        RegisterUserCMD.Parameters.Add(UsernameParameter);

        SqlParameter PasswordHashParameter = new SqlParameter()
        {
            ParameterName = "@PasswordHash",
            SqlValue = passwordHash,
            SqlDbType = SqlDbType.VarChar,
            Direction = ParameterDirection.Input
        };

        RegisterUserCMD.Parameters.Add(PasswordHashParameter);

        SqlParameter SaltParameter = new SqlParameter()
        {
            ParameterName = "@Salt",
            SqlValue = salt,
            SqlDbType = SqlDbType.VarChar,
            Direction = ParameterDirection.Input
        };

        RegisterUserCMD.Parameters.Add(SaltParameter);

        RegisterUserCMD.ExecuteNonQuery();

        liquorLakeConn.Close();

        Success = true;

        return Success;
    }

    public bool VerifyPassword(string username, string password)
    {
        bool bMatch = false;

        User LoginUser = new User();

        SqlConnection liquorLakeConn = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["LiquorLakeConnection"].ConnectionString };

        liquorLakeConn.Open();

        SqlCommand VerifyPasswordCMD = new SqlCommand()
        {
            CommandText = "UserLogIn",
            CommandType = CommandType.StoredProcedure,
            Connection = liquorLakeConn
        };

        SqlParameter UsernameParameter = new SqlParameter()
        {
            ParameterName = "@Username",
            SqlDbType = SqlDbType.VarChar,
            SqlValue = username,
            Direction = ParameterDirection.Input
        };

        VerifyPasswordCMD.Parameters.Add(UsernameParameter);

        SqlDataReader VerifyPasswordReader = VerifyPasswordCMD.ExecuteReader();

        if (VerifyPasswordReader.HasRows)
        {
            VerifyPasswordReader.Read();

            LoginUser.Username = VerifyPasswordReader["Username"].ToString();
            LoginUser.Password = VerifyPasswordReader["Password"].ToString();
            LoginUser.Salt = VerifyPasswordReader["Salt"].ToString();
            LoginUser.Role = VerifyPasswordReader["Role"].ToString();

        }

        VerifyPasswordReader.Close();

        //int saltSize = 5;

        string hashedPasswordAndSalt = CreatePasswordHash(password, LoginUser.Salt);

        bMatch = hashedPasswordAndSalt.Equals(LoginUser.Password);

        liquorLakeConn.Close();

        return bMatch;
    }

    public string GetRoles()
    {
        return "Admin";
    }
}