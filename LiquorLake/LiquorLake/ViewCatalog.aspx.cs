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

        if(Request.QueryString["category"] != null)
        {
            iCategoryID = int.Parse(Request.QueryString["category"]);
        }

        LLMS LiquorLakeManager = new LLMS();

        List<Product> products = new List<Product>();

        if(Request.QueryString["keyword"] == null)
        {
            products = LiquorLakeManager.FindProducts(iCategoryID);
        }

        foreach(Product p in products)
        {
            string html = "<div id='" + p.UPC + "' style='display:inline-block; min-width:200px; max-width:200px; min-height:200px; max-height:200px; border: 1px solid black; text-align:center; padding:10px 0; margin: 10px 25px;'>";
            html += "<img src='/App_Themes/Catalog/Images/liquor_placeholder.png' style='width:100px; height:100px;'/> <br/>";
            html += "<b>" + p.Name + "</b> <br/>";
            html += "<b>" + p.Price.ToString("C2") + "</b> <br/>";
            html += "<a class='product_info'>More info</a>";
            html += "</div>";

            ProductsDiv.InnerHtml += html;
        }
    }
}