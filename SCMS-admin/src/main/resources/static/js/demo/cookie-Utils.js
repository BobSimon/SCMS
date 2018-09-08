/**
 * set cookie
 * @param cname
 * @param cvalue
 * @param time 毫秒
 */
function setCookie(cname,cvalue,time){
    if(time == null){
        document.cookie = cname+"="+cvalue+"; "
    }else {
        var d = new Date();
        d.setTime(d.getTime()+time);
        var expires = "expires="+d.toGMTString();
        document.cookie = cname+"="+cvalue+"; "+expires;
    }

}

/**
 *  get cookie
 * @param cname
 * @returns {string}
 */
function getCookie(cname){
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name)==0) { return c.substring(name.length,c.length); }
    }
    return null;
}

