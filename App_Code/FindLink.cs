using System;
using System.Web;
/// <summary>
/// Summary description for Link
/// </summary>
public class FindLink
{
    // Builds an absolute URL
    private static string BuildAbsolute(string relativeUri)
    {
        try
        {
            // get current uri
            Uri uri = HttpContext.Current.Request.Url;
            // Create absolute path
            string app = HttpContext.Current.Request.ApplicationPath;
            if (!app.EndsWith("/")) app += "/";
            relativeUri = relativeUri.TrimStart('/');
            // return the absolute path
            return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}", uri.Host, uri.Port, app, relativeUri));
        }
        catch (System.NullReferenceException)
        {
        }
        return string.Empty;
    }    

    public static string ToNotAuthorised(string err)
    {
        return BuildAbsolute(String.Format("NotAuthorised.aspx?e={0}", err));
    }

    public static string AccessDenied()
    {
        return BuildAbsolute(String.Format("AccessDenied.aspx"));
    }
}

