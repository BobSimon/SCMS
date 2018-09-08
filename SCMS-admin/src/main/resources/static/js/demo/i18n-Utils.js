
/**
 * 设置语言类型： 默认为中文 default language zh-CN
 */
var i18nLanguage = "zh-CN";

/*
* support language Array
 */
var webLanguage = ['zh-CN', 'zh-TW', 'en'];

$(document).ready(function() {

    var navLanguage = getNavLanguage();
    if (navLanguage) {
        // is support language?
        var charSize = $.inArray(navLanguage, webLanguage);
        if (charSize > -1) {
            i18nLanguage = navLanguage; //if not  use default language
        };
    }
    //保存到cookie  _locale key 跟jfinal 默认一致
    setCookie("_locale",i18nLanguage,1000*60*60*24*30);
});

/**
 * get language from browser
 * @return {string} 浏览器国家语言
 */
var getNavLanguage = function(){
    if(navigator.appName == "Netscape"){
        return navigator.language.trim();
    }
    return false;
}

