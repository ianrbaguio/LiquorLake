using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_UpdateProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            ListProducts();
        }

        if (!IsPostBack)
        {
            //Delete all files in the UploadImage temp folder
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/UploadImage/"));
            foreach (string file in filePaths)
            {
                File.Delete(file);
            }
        }
    }

    protected void btnSearchProduct_Click(object sender, EventArgs e)
    {

    }

    private void ListProducts()
    {
        LLMS requestDirector = new LLMS();

        List<Product> products = requestDirector.SearchProduct(tbSearchProduct.Text);

        TableRow tr = new TableRow();
        TableCell tc = new TableCell();

        tc = new TableCell();
        tc.Text = "";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "UPC";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Category ID";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Name";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Price";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Size(ml)";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "CountryOfOrigin";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "WineSweetnessIndex";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Image";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Company";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Text = "Description";
        tr.Cells.Add(tc);

        ProductsTable.Rows.Add(tr);

        foreach (Product p in products)
        {
            tr = new TableRow();

            TableCell buttonCell = new TableCell();
            Button updateButton = new Button()
            {
                Text = "DETAILS",
                CssClass = "button",
                CommandArgument = p.UPC
            };

            updateButton.Click += new EventHandler(Update_Click);

            buttonCell.Controls.Add(updateButton);

            tr.Cells.Add(buttonCell);

            tc = new TableCell();
            tc.Text = p.UPC;
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.CategoryID.ToString();
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.Name;
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.Price.ToString();
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.Size.ToString();
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.CountryOfOrigin;
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.WineSweetnessIndex;
            tr.Cells.Add(tc);

            Image i = new Image();
            i.ImageUrl = "/Images/" + p.CategoryName + "/" + p.ImageUrl;
            i.Width = 100;
            i.Height = 100;

            tc = new TableCell();
            tc.Controls.Add(i);
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.Company;
            tr.Cells.Add(tc);

            tc = new TableCell();
            tc.Text = p.Description;
            tr.Cells.Add(tc);

            ProductsTable.Rows.Add(tr);
        }
    }

    private void Update_Click(object sender, EventArgs e)
    {
        //Response.Write("Clicked details");

        Button clicked = sender as Button;
        LLMS requestDirector = new LLMS();

        ProductInfoPanel.Visible = true;

        Product currentProduct = requestDirector.GetProductDetails(clicked.CommandArgument.ToString());

        //Image i = new Image();
        //i.ImageUrl = "~/Images/" + currentProduct.CategoryName + "/" + currentProduct.ImageUrl;

        tbUPC.Text = currentProduct.UPC;
        tbSize.Text = currentProduct.Size.ToString();
        tbPrice.Text = currentProduct.Price.ToString();
        tbName.Text = currentProduct.Name;
        tbDescription.Text = currentProduct.Description;
        tbCountryOfOrigin.Text = currentProduct.CountryOfOrigin;
        tbCompany.Text = currentProduct.Company;
        ddlCategoryName.SelectedIndex = ddlCategoryName.Items.IndexOf(ddlCategoryName.Items.FindByText(currentProduct.CategoryName));
        ddlSweetnessIndex.SelectedIndex = ddlSweetnessIndex.Items.IndexOf(ddlSweetnessIndex.Items.FindByText(currentProduct.WineSweetnessIndex));
        ItemImage.ImageUrl = "/Images/" + currentProduct.CategoryName + "/" + currentProduct.ImageUrl;
        ItemImage.AlternateText = currentProduct.ImageUrl;

    }


    protected void btnUpdateProduct_Click(object sender, EventArgs e)
    {
        if (ItemImage.AlternateText != "")
        {
            LLMS requestDirector = new LLMS();

            Product updatedProduct = new Product();

            updatedProduct.CategoryID = int.Parse(ddlCategoryName.SelectedValue);
            updatedProduct.CategoryName = ddlCategoryName.SelectedItem.Text;
            updatedProduct.Company = tbCompany.Text;
            updatedProduct.CountryOfOrigin = tbCountryOfOrigin.Text;
            updatedProduct.Description = tbDescription.Text;
            updatedProduct.Name = tbName.Text;
            updatedProduct.Price = decimal.Parse(tbPrice.Text);
            updatedProduct.Size = int.Parse(tbSize.Text);
            updatedProduct.UPC = tbUPC.Text;
            updatedProduct.WineSweetnessIndex = ddlCategoryName.SelectedValue.ToString();
            updatedProduct.ImageUrl = ItemImage.AlternateText;

            //fuImage.SaveAs(Server.MapPath("~/UploadImage/" + fuImage.FileName));
            //ItemImage.ImageUrl = "/UploadImage/" + fuImage.FileName;
            //updatedProduct.ImageUrl = Server.MapPath("~/UploadImage/" + fuImage.FileName);

            if (requestDirector.UpdateProduct(updatedProduct))
            {
                lblConfirmation.Text = "Successfully update product";
                if (!File.Exists(Server.MapPath("~/Images/" + updatedProduct.CategoryName + "/" + ItemImage.AlternateText)))
                    File.Copy(Server.MapPath(ItemImage.ImageUrl), Server.MapPath("~/Images/" + updatedProduct.CategoryName + "/" + ItemImage.AlternateText));
            }
            else
                lblConfirmation.Text = "Unable to update product";
        }
        else
        {
            lblConfirmation.Text = "<span style='color:red;'>Please upload an image</span>";
        }


    }

    protected void UploadImageButton_Click(object sender, EventArgs e)
    {
        fuImage.SaveAs(Server.MapPath("~/UploadImage/" + fuImage.FileName));

        ItemImage.ImageUrl = "/UploadImage/" + fuImage.FileName;
        ItemImage.AlternateText = fuImage.FileName;
    }

    protected void ddlCategoryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCategoryName.SelectedValue == "3")
            WineCategoryPanel.Visible = true;
        else
            WineCategoryPanel.Visible = false;
    }
}