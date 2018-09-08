//analyseUrlParameter
var id = AppUtils.analyseUrlParameter().id;

/**
 * Switchery checkbox
 * @type {HTMLElement | null}
 */
var isEnableCheckbox =document.getElementById('demo-sw');
var isEnableSwitchery;

$(document).ready(function () {

    isEnableSwitchery = new Switchery(isEnableCheckbox);

    $('#department').bootstrapSelect({
        url:'/system/department/getDepartmentList',
        // data: {},
        valueField: 'id',
        textField: 'name',
        onBeforeLoad: function(target, param) {

        },
        onLoadSuccess: function (target) {

            console.log("tst")
        }

    });

    if (id != undefined){
        getUserDetail(id);
    }
    // $('#department').bootstrapSelect("setValue","3");
    /**
     * checkbox change
     */
    isEnableCheckbox.onchange = function() {
        if(!isEnableCheckbox.hasAttribute("checked")){
            $("#demo-sw").attr("checked", true);
        }else{
            $("#demo-sw").removeAttr("checked");
        }
        isEnableCheckbox.check==true?isEnableCheckbox.check=false:isEnableCheckbox.check=true;
    };
});


//back to last page
//===============================================
function back() {
    history.back(-1);
}

//getUserDetail info
//==============================================
function getUserDetail(id) {
    $.ajax({
        url:"/system/user/getUser?id="+id,
        success:function(result){
            setUserValue(result);
        }
    });
}
//set User Info value
//==============================================
function setUserValue(user) {
    $("input[name=username]").val(user.username);
    $("input[name=email]").val(user.email);
    $("input[name=fullname]").val(user.fullname);
    $("input[name=gender][value=" + user.gender + "]").prop("checked", true);
    $("select[name=credentialType] option[value="+user.credentialType+"]").attr("selected", "selected");
    $("input[name=credentialNum]").val(user.credentialNum);
    $("input[name=phoneNumber]").val(user.telphone);
    $("input[name=birthday]").val(user.birthday);
    $("#avatar").attr("src", user.avatar);
    if(user.enable == 1){
        setSwitchery(isEnableSwitchery,true)
    }else{
        setSwitchery(isEnableSwitchery,false)
    }
}

/*
 * 切换Switchery开关函数
 * * switchElement Switchery对象
 * * checkedBool 选中的状态
 */
function setSwitchery(switchElement, checkedBool) {
    if ((checkedBool && !switchElement.isChecked()) || (!checkedBool && switchElement.isChecked())) {
        switchElement.setPosition(true);
        switchElement.handleOnchange(true);
    }
}