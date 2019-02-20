using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    public string UPC { get; set; }

    public int CategoryID { get; set; }

    public string Name { get; set; }

    public int Size { get; set; }

    public decimal Price { get; set; }

    public string CountryOfOrigin { get;set;}

    public string WineSweetnessIndex { get; set; }

    public string ImageUrl { get; set; }

    public string Company { get; set; }

    public string Description { get; set; }
}