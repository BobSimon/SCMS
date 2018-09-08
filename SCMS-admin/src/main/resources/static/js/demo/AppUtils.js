
function AppUtils(){}
/**
 * analyse Url Parameter
 */
AppUtils.analyseUrlParameter = function()
{
    var json = {};
    var url = window.location.href;
    var pos = url.indexOf("?");
    if(pos != -1)
    {
        var tails = url.substring(pos + 1);
        var parameters = tails.split("&");
        for(var i = 0; i < parameters.length; i++)
        {
            var parameter = parameters[i].split("=");
            json[parameter[0]] = parameter.length > 1? parameter[1]: "";
        }
    }
    return json;
}