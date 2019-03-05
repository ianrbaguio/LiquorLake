using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LLMS
/// </summary>
public class LLMS
{
    public List<Product> FindProducts(int categoryid)
    {
        Products productManager = new Products();

        return productManager.GetProducts(categoryid);
    }

    public List<Category> FindCategories()
    {
        Categories categoriesManager = new Categories();

        return categoriesManager.SearchCategories();
    }

    public List<Product> SearchProduct(string keyword)
    {
        Products productManager = new Products();

        return productManager.SearchProduct(keyword);
    }
}