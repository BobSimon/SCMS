// This is just a sample how to initialize plugins or components.
//
var Department = function(){
    var id;
    var name;
    var code;
    var icon;
    var parentid;
    var leaf;
    var enable;
    var desc;
}

var department;

$(document).ready(function () {
    /**
     * Switchery checkbox
     * @type {HTMLElement | null}
     */
    var changeCheckbox = document.getElementById('enable');
    var isEnableSwitchery = new Switchery(changeCheckbox);

    // var no_parentCheckbox = document.getElementById('no_parent');
    // var noParentSwitchery = new Switchery(no_parentCheckbox);
    // noParentSwitchery.disable();
    /**
     * enable checkbox change
     */
    /* changeCheckbox.onchange = function () {
        if (!changeCheckbox.checked) {
            $("#enable").attr("checked", true);

        } else {
            $("#enable").removeAttr("checked");
        }
        changeCheckbox.check == true ? changeCheckbox.check = false : changeCheckbox.check = true;
    }; */

    /**
     * no parent department select value == 0
     */
    // no_parentCheckbox.onchange = function () {
    //     if (no_parentCheckbox.checked) {
    //         // $("#no_parent").attr("checked", true);
    //         $('#loaddepart').append("<option value='0' selected>没有上级部门</option>").trigger('change');;
    //         $('#loaddepart').prop("disabled", true);
    //     } else {
    //         // $("#no_parent").removeAttr("checked");
    //         $('#loaddepart').append("<option value='0' selected>请选择部门</option>").trigger('change');;
    //         $('#loaddepart').prop("disabled", false);
    //     }
    //
    // };
    //init department Tree
    $.ajax({
        //几个参数需要注意一下
        type: "get",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/system/department/getDepartmentTree",//url
        // data: ,
        success: function (result) {

            $("#depart_tree").append(getDepartment(result))

            $("#depart_tree").jstree({
                "plugins": ["search"]
            });
        },
        error: function () {
            alert("获取部门树异常！");
        }
    })
    // select2Utils.initRemoteSelect2("loaddepart","/system/department/getDepartPage",false,"xuan")
    $("#loaddepart").select2({
        ajax: {
            url: "/system/department/getDepartPage",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page,
                    id:$("#id").val()
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.items,
                    pagination: {
                        more: (params.page * 15) < data.total_count
                    }
                };
            },
            cache: true
        },
        placeholder: '请选择部门',
        allowClear: true,
        escapeMarkup: function (markup) {
            return markup;
        }, // let our custom formatter work
        // minimumInputLength: 1,
        templateResult: formatRepo,
        templateSelection: formatRepoSelection
    });

    function formatRepo(repo) {
        if (repo.loading) {
            return repo.text;
        }

        var markup = '<div href="#" data-original-title="" title=""> ' +
            '<i class="' + repo.icon + '"></i><span class="menu-title">' + repo.name + '</span><i class="arrow"></i></div>'
        return markup;
    }

    function formatRepoSelection(repo) {
        return repo.name || repo.text;
    }

    //jstree serach
    var to = false;
    $('#input-tree').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $('#input-tree').val();
            $('#depart_tree').jstree(true).search(v);
        }, 250);
    });

    $('#depart_tree').bind("activate_node.jstree", function (obj, e) {
        // 处理代码
        // 获取当前节点
        var currentNode = e.node;
        if (currentNode) {
            $.ajax({
                //几个参数需要注意一下
                type: "get",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/system/department/getDepartmentDetail",//url
                data: {id: currentNode.data.id},
                success: function (result) {
                    // setDepartmentInfo(result);
                    setDepartValue(currentNode,result);
                },
                error: function () {
                    alert("获取部门详情失败！");
                }
            })
        }
    });
    /**
     * 设置department info
     * @param result
     */
    var setDepartmentInfo = function(result){
        if(!department){
            department = new Department();
        }
        department.name = result.name;
        department.id = result.id;
        department.code = result.code;
        department.icon = result.icon;
        department.enable = result.enable;
        department.desc = result.desc;
        department.leaf = result.leaf;
        department.parentid = result.parentid;

    }
    /**
     * 设置部门值
     * @param currentNode
     * @param result
     */
    var setDepartValue = function(currentNode,result){
        $("input[name='name']").val(result.name);
        $("input[name='id']").val(result.id)
        $("input[name='code']").val(result.code);
        $("input[name='icon']").val(result.icon);
        $("#desc").text(result.desc);
        if (result.enable == 1) {
            SwitcheryUtils.setEnable(isEnableSwitchery, true)
        } else {
            SwitcheryUtils.setEnable(isEnableSwitchery, false)
        }
        // new Switchery(changeCheckbox);
        var loaddepart = $('#loaddepart');
        // loaddepart.empty();
        if (result.parentid != 0) {
            var parentid = currentNode.parent;
            parentnode = $('#depart_tree').jstree("get_node", parentid);
            loaddepart.append("<option value='" + parentnode.data.id + "' selected>" + parentnode.text + "</option>");
            // loaddepart.prop("disabled", false);
            // SwitcheryUtils.setEnable(noParentSwitchery, false)
        } else {
            // var data = [{name:"a",id:1},{name:"b",id:2}];
            // select2Utils.initSelect2Value("loaddepart",data);
            // initSelect(loaddepart);
            loaddepart.append("<option value='0' selected>没有上级部门</option>");
            // loaddepart.prop("disabled", true);
            // SwitcheryUtils.setEnable(noParentSwitchery, true)
        }
    }


    /**
     * 提交按钮
     */
    $("#submit").on("click",function () {

        syncDepartmentInfo();

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/system/department/addOrUpdate",//url
            // data: $('#department').serialize(),
            data:department,
            success: function (result) {
                bootbox.alert({
                    closeButton:false,
                    message:result.msg,
                    callback : function(result) {
                        //Callback function here
                        window.location.reload();
                    },
                    animateIn: 'bounceIn',
                    animateOut : 'bounceOut'
                });
            },
            error: function () {
                bootbox.alert({
                    closeButton:false,
                    message:"操作异常!"
                });
            }
        })
    })
    /**
     * sync department info before ajax
     */
    var syncDepartmentInfo = function(){
        if(!department){
            department = new Department();
        }
        department.name = $("input[name='name']").val();
        department.id = $("input[name='id']").val()
        department.code = $("input[name='code']").val();
        department.icon = $("input[name='icon']").val();
        department.enable = changeCheckbox.checked ? 1:0;
        department.desc = $("textarea[name='desc']").val();
        department.leaf = $("#loaddepart").val() == 0 ? 1:0;
        department.parentid = $("#loaddepart").val()?$("#loaddepart").val():0;
    }
});


 /**
 * 选中颜色
 * @param e
 */
/*function toggleSelect(e) {
    var target = $(e);
    target.toggleClass("selected");
}*/

/**
 * 展开/收起
 */
$("#nestable-menu").on("click", function (e) {
    var target = $(e.target);
    var instance = $("#depart_tree").jstree(true);
    if (target.hasClass("btn-success")) {
        instance.close_all();
        target.text("展开全部");

    } else {
        target.text("收起全部");
        instance.open_all();
    }
    target.toggleClass("btn-success");
})


/**
 * 构建部门数html
 * @param depart_json
 * @returns {string}
 */
var getDepartment = function (depart_json) {
    var html = '<ul>';
    for (var i = 0, l = depart_json.length; i < l; i++) {
        // for (var d in depart_json[i]) {
        html +=
            '<li data-id="' + depart_json[i].id + '" data-jstree="{&quot;opened&quot;:true, &quot;icon&quot;:&quot;' + depart_json[i].icon + '&quot;}">' + depart_json[i].name
        //如果存在子节点
        if (depart_json[i].children && depart_json[i].children.length != 0) {

            html += getDepartment(depart_json[i].children);
        }
        // }
        html += '</li>'
    }

    html += '</ul>'
    return html;
}

/**
 * 点击下拉框动态获取列表 bootstrap-select
 */
/*$('#loaddepart').on('shown.bs.select', function (e) {
    // do something...
    // console.log("do something");
    // $('#loaddepart').append("<option value='222'>请选择</option>");
    $('#loaddepart').empty();
    $.ajax({
        //几个参数需要注意一下
        type: "get",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/system/department/getDepartmentList" ,//url
        // data: ,
        success: function (result) {
            var html = "";
            for(var i=0,l=result.length;i<l;i++){
                html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
            }
            html += "<option value='0'>no thing select</option>";
            $('#loaddepart').append(html);
            $('#loaddepart').selectpicker('refresh');
        },
        error : function() {
            alert("获取部门树异常！");
        }
    })

});*/


