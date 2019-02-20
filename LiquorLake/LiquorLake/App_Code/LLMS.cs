using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LLMS
/// </summary>
public class LLMS
{
    public List<Product> FindProducts()
    {
        Products productManager = new Products();

        return productManager.GetProducts();
    }
}