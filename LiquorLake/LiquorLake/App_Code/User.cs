﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public string Username { get; set; }

    public string Password { get; set; }

    public string Salt { get; set; }

    public string Role { get; set; }
}