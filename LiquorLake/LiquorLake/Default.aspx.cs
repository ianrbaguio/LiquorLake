using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LLMS LiquorLakeManager = new LLMS();

        List<Category> CategoryList = LiquorLakeManager.FindCategories();

        foreach(Category c in CategoryList)
        {
            string categoryDiv = "<div class='category_item_container'>";
            categoryDiv += "<a href='/ViewCatalog.aspx?category=" + c.CategoryID + "'>";
            categoryDiv += "<div class='category_image_container'>";
            //categoryDiv += "<img src='/App_Themes/Catalog/Images/liquor_placeholder.png'/>";
            categoryDiv += "<img src='/App_Themes/Master/Images/" + c.Name.ToLower() + "categoryimage.jpg'/>";
            categoryDiv += "<div class='shade_overlay'></div>";
            categoryDiv += "<p class='category_item_name'>" + c.Name + "<p>";
            categoryDiv += "</div>";
            categoryDiv += "</a>";
            categoryDiv += "</div>";

            CategoriesContainer.InnerHtml += categoryDiv;
        }

        
    }
}