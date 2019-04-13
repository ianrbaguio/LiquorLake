using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LLMS requestDirector = new LLMS();

        List<Product> products = requestDirector.FindProducts();

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
        tc.Text = "Size";
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

        foreach(Product p in products)
        {
            tr = new TableRow();

            TableCell buttonCell = new TableCell();
            Button deleteButton = new Button()
            {
                Text = "DELETE",
                CssClass = "button"
            };

            buttonCell.Controls.Add(deleteButton);

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
            tc.Text = p.Name;
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

            tc = new TableCell();
            tc.Text = p.ImageUrl;
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
}