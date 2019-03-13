using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
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
            // Product Item
            string html = "<div id='" + p.UPC + "' class='product_item_container'>";
            html += "<div class='product_image_container'><img src='/Images/" + p.CategoryName + "/" + p.ImageUrl + "' alt='" + p.Name + "'/></div>";
            html += "<div class='product_item_name'><b>" + p.Name + "</b></div>";
            html += "<p class='product_item_price'><b>" + p.Price.ToString("C2") + "</b></p>";
            html += "<input id='buttonMI_" + p.UPC + "' class='more_info_button' type='button' value='More info'/>";
            html += "</div>";

            //Modal Dialog
            html += "<div id='" + p.UPC + "Modal' class='modal'>";
            html += "<div class='modal-content' style='width: 80%;'>";
            html += "<div class='modal-header'>";
            html += "<h2>" + p.Name + "</h2>";
            html += "<button id='" + p.UPC + "_close_button' type='button' class='close'><i class='fas fa-times'></i></button>";
            html += "</div>"; //modal-header closing div

            html += "<div class='modal-body'>";

            html += "<div class='modal_content_left'>";
            html += "<img src='/Images/" + p.CategoryName + "/" + p.ImageUrl + "'/>";
            html += "</div>"; //left details div

            html += "<div class='modal_content_right'>";
            html += "<p><b>UPC: </b>" + p.UPC + "</p>";
            html += "<p><b>Category: </b>" + p.CategoryName + "</p>";
            html += "<p><b>Price: </b>" + p.Price.ToString("C2") + "</p>";
            html += "<p><b>Name: </b>" + p.Name + "</p>";
            html += "<p><b>Size: </b>" + p.Size + "</p>";
            html += "<p><b>Country of Origin: </b>" + p.CountryOfOrigin + "</p>";
            html += "<p><b>Wine Sweetness Index: </b>" + p.WineSweetnessIndex + "</p>";
            html += "<p><b>Company: </b>" + p.Company + "</p>";
            html += "<p><b>Description: </b>" + p.Description + "</p>";
            html += "</div>";

            html += "</div>";//modal body closing div

            html += "</div>"; //modal-content closing div
            html += "</div>"; //modal closing div

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