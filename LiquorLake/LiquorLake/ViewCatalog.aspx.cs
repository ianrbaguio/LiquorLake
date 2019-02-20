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
        LLMS LiquorLakeManager = new LLMS();

        List<Product> products = new List<Product>();

        if(Request.QueryString["keyword"] == null)
        {
            products = LiquorLakeManager.FindProducts();
        }

        foreach(Product p in products)
        {
            string html = "<div id='" + p.UPC + "' style='display:inline-block;'>";
            html += "<img src='" + p.ImageUrl + "'/> <br/>";
            html += "<b>" + p.Name + "</b> <br/>";
            html += "<b>" + p.Price + "</b>";

            ProductsDiv.InnerHtml += html;
        }
    }
}