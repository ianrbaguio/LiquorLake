using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddProductButton_Click(object sender, EventArgs e)
    {
        string imageName = ImageUpload.FileName;

        Product newProduct = new Product();
        newProduct.UPC = UPCTB.Text;
        newProduct.CategoryID = int.Parse(CategoryDropDownList.SelectedValue);
        newProduct.CategoryName = CategoryDropDownList.SelectedItem.Text;
        newProduct.Name = ProductNameTB.Text;
        newProduct.Price = decimal.Parse(PriceTB.Text);
        newProduct.Size = int.Parse(SizeTB.Text);
        newProduct.CountryOfOrigin = CountryOfOriginTB.Text;
        newProduct.WineSweetnessIndex = WineSweetnessIndexDropDownList.SelectedValue;
        newProduct.Company = CompanyTB.Text;
        newProduct.Description = DescriptionTB.Text;
        newProduct.ImageUrl = Server.MapPath(ImageUpload.FileName);

        LLMS LiquorLakeManager = new LLMS();

        bool Confirmation = LiquorLakeManager.InsertProduct(newProduct, imageName);

        AddProductLabel.Text = (Confirmation) ? "<span style='color:green'>New product added.</span>" : "<span style='color:red'>Error encountered while adding new product</span>";


    }
}