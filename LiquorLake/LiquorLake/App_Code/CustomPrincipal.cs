using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;

/// <summary>
/// Summary description for CustomPrincipal
/// </summary>
public class CustomPrincipal : IPrincipal
{
    public CustomPrincipal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private IIdentity _identity;
    private string[] _roles;

    public CustomPrincipal(IIdentity identity, string[] roles)
    {
        _identity = identity;
        _roles = new string[roles.Length];
        roles.CopyTo(_roles, 0);
        Array.Sort(roles);
    }

    public bool IsInRole(string role)
    {
        return Array.BinarySearch(_roles, role) >= 0 ? true : false;
    }

    public IIdentity Identity
    {
        get
        {
            return _identity;
        }

    }
}