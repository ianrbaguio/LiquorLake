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
            string categoryDiv = "<div style='min-width:180px; min-height:150px; display:inline-block; border: 1px solid gray; padding:25px; margin:10px;'>";
            categoryDiv += "<a href='/ViewCatalog.aspx?category=" + c.CategoryID + "'>";
            categoryDiv += "<img src='/App_Themes/Catalog/Images/liquor_placeholder.png' style='width:100px; height:100px;'/><br/>";
            categoryDiv += "<b>" + c.Name + "<b>";
            categoryDiv += "</a>";
            categoryDiv += "</div>";

            CategoriesContainer.InnerHtml += categoryDiv;
        }

        
    }
}