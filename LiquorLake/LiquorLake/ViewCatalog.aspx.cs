using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCatalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int iCategoryID = 0;
        string keyword = "";
        LLMS LiquorLakeManager = new LLMS();
        List<Product> products = new List<Product>();

        if (Request.QueryString["keyword"] != null)
        {
            keyword = Request.QueryString["keyword"].ToString();
            products = LiquorLakeManager.SearchProduct(keyword);
        }
        else if(Request.QueryString["category"] != null)
        {
            iCategoryID = int.Parse(Request.QueryString["category"]);
            products = LiquorLakeManager.FindProducts(iCategoryID);
        }
        else
        {
            products = LiquorLakeManager.FindProducts();
        }

        GenerateProducts(products);
        
    }

    private void GenerateProducts(List<Product> products)
    {
        ProductsDiv.InnerHtml = "";
        foreach (Product p in products)
        {

            string html = "<div id='" + p.UPC + "' style='display:inline-block; min-width:200px; max-width:200px; min-height:200px; max-height:200px; border: 1px solid black; text-align:center; padding:10px 0; margin: 10px 25px;'>";
            html += "<img src='/Images/" + p.CategoryName + "/" + p.ImageUrl + "' style='height:225px;'/> <br/>";
            html += "<div style='width:100%; max-height: 25px;'><b>" + p.Name + "</b></div> <br/>";
            html += "<b>" + p.Price.ToString("C2") + "</b> <br/>";
            html += "<a class='product_info'>More info</a>";
            html += "</div>";

            ProductsDiv.InnerHtml += html;
        }
    }

    protected void SearchButton_ServerClick(object sender, EventArgs e)
    {
        string keyword = SearchTB.Text;
        string urlPath = "~/ViewCatalog.aspx?keyword=" + keyword;
        if(keyword != "")
        {
            Response.Redirect(urlPath);
        }
    }
}