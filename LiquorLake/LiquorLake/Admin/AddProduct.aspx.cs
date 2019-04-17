using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Delete all files in UploadImage temp folder
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/UploadImage/"));
            foreach (string file in filePaths)
            {
                File.Delete(file);
            }
        }
    }

    protected void AddProductButton_Click(object sender, EventArgs e)
    {
        if(UploadedImage.AlternateText != "")
        {
            Product newProduct = new Product();
            newProduct.UPC = UPCTB.Text;
            newProduct.CategoryID = int.Parse(CategoryDropDownList.SelectedValue);
            newProduct.CategoryName = CategoryDropDownList.SelectedItem.Text;
            newProduct.Name = ProductNameTB.Text;
            newProduct.Size = int.Parse(SizeTB.Text);
            newProduct.Price = decimal.Parse(PriceTB.Text);
            newProduct.CountryOfOrigin = CountryOfOriginTB.Text;
            newProduct.WineSweetnessIndex = WineSweetnessIndexDropDownList.SelectedValue;
            newProduct.Company = CompanyTB.Text;
            newProduct.Description = DescriptionTB.Text;
            newProduct.ImageUrl = Server.MapPath("~/UploadImage/" + UploadedImage.AlternateText);

            LLMS LiquorLakeManager = new LLMS();

            bool Confirmation = LiquorLakeManager.InsertProduct(newProduct, UploadedImage.AlternateText);

            if (!File.Exists(Server.MapPath("~/Images/" + newProduct.CategoryName + "/" + UploadedImage.AlternateText)))
                File.Copy(Server.MapPath(UploadedImage.ImageUrl), Server.MapPath("~/Images/" + newProduct.CategoryName + "/" + UploadedImage.AlternateText));

            AddProductLabel.Text = (Confirmation) ? "<span style='color:green'>New product added.</span>" : "<span style='color:red'>Error encountered while adding new product</span>";
        }
        else
        {
            AddProductLabel.Text = "<span style='color:red'>Please upload an image</span>";
        }

    }

    protected void ImageUploadButton_Click(object sender, EventArgs e)
    {
        ImageUpload.SaveAs(Server.MapPath("~/UploadImage/" + ImageUpload.FileName));

        UploadedImage.ImageUrl = "/UploadImage/" + ImageUpload.FileName;
        UploadedImage.AlternateText = ImageUpload.FileName;

    }

    protected void CategoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CategoryDropDownList.SelectedValue == "3")
            WineCategoryPanel.Visible = true;
        else
            WineCategoryPanel.Visible = false;
    }   
}