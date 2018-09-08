
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
        url: '/system/user/tableData',
        columns: [{
            checkbox: true
        },{
            field: 'id',
            formatter:'invoiceFormatter',
            title: 'ID',
            sortable:true,
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'username',
            title: '用户名',
            editable: {
                type: 'text'
            },
            sortable:true,
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'avatar',
            title: '头像',
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'createdate',
            title: '注册日期',
            sortable:true,
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'telphone',
            title: '手机',
            editable: {
                type: 'text'
            },
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'status',
            align: 'center',
            title: '状态',
            formatter:'statusFormatter',
            sortable:true,
            formatter: function (value, row, index) {
                return vlaue;
            }
        }, {
            field: 'note',
            title: '备注',
            editable: {
                type: 'text'
            },
            formatter: function (value, row, index) {
                return vlaue;
            }
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
    var $table = $('#demo-custom-toolbar'),	$remove = $('#demo-delete-row');

    $table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    });

    $remove.click(function () {
        var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
        $table.bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
        $remove.prop('disabled', true);
    });


});




// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// Sample format for Invoice Column.
// =================================================================
function invoiceFormatter(value, row) {
    return '<a href="#" class="btn-link" > Order #' + value + '</a>';
}

// Sample format for avatar Column.
// =================================================================
function avatarFormatter(value, row) {
    return '<img class="img-circle img-sm img-border" src="'+value+'" alt="Profile Picture">'
}


// Sample Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
    return '<a href="#" class="btn-link" > ' + value + '</a>';
}




// Sample Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<span class="text-muted"><i class="fa fa-clock-o"></i> ' + value + '</span>';
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
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-'+ labelColor+'"> ' + value + '</div>';
}



// Sample Format for Tracking Number Column.
// =================================================================
function trackFormatter(value, row) {
    if (value) return '<i class="fa fa-plane"></i> ' + value;
}



// Sort Price Column
// =================================================================
function priceSorter(a, b) {
    a = +a.substring(1); // remove $
    b = +b.substring(1);
    if (a > b) return 1;
    if (a < b) return -1;
    return 0;
}

