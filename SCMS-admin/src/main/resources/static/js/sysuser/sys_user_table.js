
// Tables-BS-Table.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(document).ready(function() {


    // BOOTSTRAP TABLES USING FONT AWESOME ICONS
    // =================================================================
    // Require Bootstrap Table
    // http://bootstrap-table.wenzhixin.net.cn/
    //
    // =================================================================
    jQuery.fn.bootstrapTable.defaults.icons = {
        paginationSwitchDown: 'demo-pli-arrow-down',
        paginationSwitchUp: 'demo-pli-arrow-up',
        refresh: 'demo-pli-repeat-2',
        toggle: 'demo-pli-layout-grid',
        columns: 'demo-pli-check',
        detailOpen: 'demo-psi-add',
        detailClose: 'demo-psi-remove'
    }

    // EDITABLE - COMBINATION WITH X-EDITABLE
    // =================================================================
    // Require X-editable
    // http://vitalets.github.io/x-editable/
    //
    // Require Bootstrap Table
    // http://bootstrap-table.wenzhixin.net.cn/
    //
    // Require X-editable Extension of Bootstrap Table
    // http://bootstrap-table.wenzhixin.net.cn/
    // =================================================================
    $('#demo-editable').bootstrapTable({
        idField: 'id',
        sortable:true,
        sortOrder: "desc",
        pagination: true,//是否显示分页（*）
        queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                            // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
        sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
        url: '/system/user/getUserList',
        columns: [{
            checkbox: true
        },{
            field: 'id',
            /*formatter:'invoiceFormatter',*/
            title: 'ID',
            sortable:true
        }, {
            field: 'username',
            title: '用户名',
            editable: {
                type: 'text',
                url: '/system/user/editName',
                validate: function (value) {
                	if (!$.trim(value)) {
                        return '用户名不能为空';
                    }
                	var valid;
                	$.ajax({
                		url:'/system/user/checkUsername',
                		type:'post',
                		async:false,
                		data:{"username":value},
                		success:function(result){
                			valid=result.valid;
                		}
                	})
                	if(!valid){
                		return '用户名已被占用';
                	}
                	
                }
            },
            sortable:true
        /*}, {
            field: 'avatar',
            title: '头像',
            formatter:'avatarFormatter',*/
        }, {
            field: 'createdate',
            title: '注册日期',
           /* formatter:'DateFormatter',*/
            sortable:true
        }, {
            field: 'telphone',
            title: '手机',
            editable: {
                type: 'text',
                url: '/system/user/editTelphone',
                validate: function (value) {
                	if (!$.trim(value)) {
                        return '手机号码不能为空';
                    }
                	if (!(/^1[34578]\d{9}$/.test(value))) {
                		return '手机号码有误,请重新输入';
                	}
                }
            }
        }, {
            field: 'status',
            align: 'center',
            title: '状态',
            formatter:'statusFormatter',
            sortable:true
        }, {
            field: 'note',
            title: '备注',
            editable: {
                type: 'text',
                url: '/system/user/editNote',
            }
        },{
            field: '',
            title: '操作',
            align: 'center',
            formatter:'editFormatter',
        }]
    });



    // X-EDITABLE USING FONT AWESOME ICONS
    // =================================================================
    // Require X-editable
    // http://vitalets.github.io/x-editable/
    //
    // Require Font Awesome
    // http://fortawesome.github.io/Font-Awesome/icons/
    // =================================================================
    $.fn.editableform.buttons =
        '<button type="submit" class="btn btn-primary editable-submit">'+
            '<i class="fa fa-fw fa-check"></i>'+
        '</button>'+
        '<button type="button" class="btn btn-default editable-cancel">'+
            '<i class="fa fa-fw fa-times"></i>'+
        '</button>';

    // BOOTSTRAP TABLE - CUSTOM TOOLBAR
    // =================================================================
    // Require Bootstrap Table
    // http://bootstrap-table.wenzhixin.net.cn/
    // =================================================================
    var $table = $('#demo-editable'), $remove = $('#demo-delete-row'), $add = $('#demo-add-row');

    $table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    });
    //删除
    $remove.click(function () {
        var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
        $.ajax({
        	url:"/system/user/delete?ids="+ids,
        	success:function(result){
        		var idsArr=result.split(",");
        		var a=[];
        		for(var i in idsArr){
        			a.push(parseInt(idsArr[i]))
        		}
        		$table.bootstrapTable('remove', {
                    field: 'id',
                    values: a
                });
        	}
        });
        $remove.prop('disabled', true);
    });

    //前往新增页面
    $add.click(function () {
        window.location.href="/system/user/addUser";
    });

});

// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================

// Sample format for avatar Column.
// =================================================================
function avatarFormatter(value, row) {
    return '<img class="img-circle img-sm img-border" src="'+value+'" alt="Profile Picture">'
}

// Sample Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-sysuser';
    return '<span class="text-muted"><i class="fa fa-clock-o"></i> ' + value + '</span>';
}

// Sample Format for edit Column.
// =================================================================
function editFormatter(value, row) {

    return '<button onclick="edit('+row.id+')" class="btn btn-info btn-labeled icon-lg fa fa-edit">编辑</button>';
}


// Sample Format for Order Status Column.
// =================================================================
function statusFormatter(value, row) {
    var labelColor;
    if (value == "1") {
        labelColor = "success";
        value = "正常";
/*    }else if(value == "Unpaid"){
        labelColor = "warning";
    }else if(value == "Shipped"){
        labelColor = "info";*/
    }else if(value == "2"){
        labelColor = "danger";
        value = "封号";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-sysuser';
    return '<div class="label label-table label-'+ labelColor+'"> ' + value + '</div>';
}
//edit user
function edit(id) {
    window.location.href="/system/user/addUser?id="+id;
}