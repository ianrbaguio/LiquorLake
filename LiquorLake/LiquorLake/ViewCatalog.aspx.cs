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
            string html = "<div id='" + p.UPC + "' style='display:inline-block; min-width:300px; max-width:300px; min-height:300px; max-height:300px; text-align:center; padding:25px 10px; margin: 10px 25px;'>";
            html += "<img src='/Images/" + p.CategoryName + "/" + p.ImageUrl + "' style='height:225px; max-width:150px;'/> <br/>";
            html += "<div style='width:100%; max-height: 25px;'><b>" + p.Name + "</b></div> <br/>";
            html += "<b>" + p.Price.ToString("C2") + "</b> <br/>";
            html += "<input id='buttonMI_" + p.UPC + "' class='more_info_button' type='button' value='More info'/>";
            html += "</div>";
            //Modal Dialog
            html += "<div id='" + p.UPC + "Modal' class='modal'>";
            html += "<div class='modal-content'>";

            html += "<div class='modal-header'>";
            html += "<button id='" + p.UPC + "_close_button' type='button' class='close'>&times;</button>";
            html += "<h2>" + p.Name + "</h2>";
            html += "</div>"; //modal-header closing div

            html += "<div class='modal-body'>";

            html += "<div style='float:left; width:45%; text-align:center;'>";
            html += "<img src='/Images/" + p.CategoryName + "/" + p.ImageUrl + "' style='height:225px; max-width:150px;'/> <br/>";
            html += "</div>"; //left details div

            html += "<div style='float:right; width: 45%; text-align:left;'>";
            html += "UPC: " + p.UPC + "<br/>";
            html += "Category: " + p.CategoryName + "<br/>";
            html += "Price: " + p.Price.ToString("C2") + "<br/>";
            html += "Name: " + p.Name + "<br/>";
            html += "Size: " + p.Size + "<br/>";
            html += "Country of Origin: " + p.CountryOfOrigin + "<br/>";
            html += "Wine Sweetness Index: " + p.WineSweetnessIndex + "<br/>";
            html += "Company: " + p.Company + "<br/>";
            html += "Description: " + p.Description + "<br/>";
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