
var select2Utils = new Select2Utils();

var option = function () {
    var name;
    var id;
    var selected;
    var enable;
}

function Select2Utils() {

    this.initRemoteSelect2 = function (id, url, isMultiple, placeholder) {
        $('#' + id).select2({
            ajax: {
                url: url,
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, // search term
                        page: params.page,
                        id: $("#id").val()
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
            placeholder: placeholder,
            allowClear: true,
            multiple: typeof(isMultiple) == 'undefined' ? false : isMultiple,
            escapeMarkup: function (markup) {
                return markup;
            },
            // let our custom formatter work
            // minimumInputLength: 1,
            templateResult: formatResult,
            templateSelection: formatSelection
        });
    };

    this.initLocalSelect2 = function (id, isMultiple, localdata, placeholder) {
        $('#' + id).select2({
            minimumInputLength: 0,
            multiple: typeof(isMultiple) == 'undefined' ? false : isMultiple,
            placeholder: placeholder,
            matcher: formatMatch,
            allowClear: true,  //是否允许用户清除文本信息
            templateResult: formatResult,
            templateSelection: formatSelection,
            data: {
                results: localdata
            }
        });
    };

    /**
     * create the option and append to Select2
     * new option(name,value,selected,enable)
     * @param element
     */
    this.initSelect2Value = function (id, arrayData) {

        $('#' + id).val(null).trigger('change'); //clear value first

        var element = $("#"+id);
        //append option to selector
        arrayData.forEach(function(ele,index){
            var option = new Option(ele.name, ele.id, true, true);
            element.append(option);//.trigger('change');
        });

        // manually trigger the `select2:select` event
        element.trigger({
            type: 'select2:select',
            // params: {
            //     data: data
            // }
        });
    };
    /**
     * clear all current selections in a Select2 control
     * @param id
     */
    this.clearSelect2 = function (id) {
        $('#' + id).val(null).trigger('change');
    };
    /**
     * Disabling a Select2 control
     * @param id
     * @param boolean
     */
    this.enableSelect2 = function (id, boolean) {
        $('#' + id).prop("disabled", boolean);
    };
}

function formatResult(result) {
    if (result.loading) {
        return result.text;
    }

    var markup = '<div href="#" data-original-title="" title=""> ' +
        '<i class="' + result.icon + '"></i><span class="menu-title">' + result.name + '</span><i class="arrow"></i></div>'
    return markup;
}

function formatSelection(result) {
    return result.name || result.text;
}

function formatMatch(params, data) {
    // If there are no search terms, return all of the data
    if ($.trim(params.term) === '') {
        return data;
    }

    // Do not display the item if there is no 'text' property
    if (typeof data.text === 'undefined') {
        return null;
    }

    // `params.term` should be the term that is used for searching
    // `data.text` is the text that is displayed for the data object
    if (data.text.indexOf(params.term) > -1) {
        var modifiedData = $.extend({}, data, true);
        modifiedData.text += ' (matched)';

        // You can return modified objects from here
        // This includes matching the `children` how you want in nested data sets
        return modifiedData;
    }

    // Return `null` if the term should not be displayed
    return null;
}