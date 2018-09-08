// Form-Validation.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -


$(document).ready(function () {


    // FORM VALIDATION
    // =================================================================
    // Require Bootstrap Validator
    // http://bootstrapvalidator.com/
    // =================================================================


    // FORM VALIDATION FEEDBACK ICONS
    // =================================================================
    var faIcon = {
        valid: 'fa fa-check-circle fa-lg text-success',
        invalid: 'fa fa-times-circle fa-lg',
        validating: 'fa fa-refresh'
    }


    // FORM VALIDATION ON TABS
    // =================================================================
    $('#demo-bv-bsc-tabs').bootstrapValidator({
        excluded: [':disabled'],
        feedbackIcons: faIcon,
        fields: {
            fullName: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required'
                    }
                }
            },
            company: {
                validators: {
                    notEmpty: {
                        message: 'The company name is required'
                    }
                }
            },
            memberType: {
                validators: {
                    notEmpty: {
                        message: 'Please choose the membership type that best meets your needs'
                    }
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: 'The address is required'
                    }
                }
            },
            city: {
                validators: {
                    notEmpty: {
                        message: 'The city is required'
                    }
                }
            },
            country: {
                validators: {
                    notEmpty: {
                        message: 'The city is required'
                    }
                }
            }
        }
    }).on('status.field.bv', function (e, data) {
        var $form = $(e.target),
            validator = data.bv,
            $tabPane = data.element.parents('.tab-pane'),
            tabId = $tabPane.attr('id');

        if (tabId) {
            var $icon = $('a[href="#' + tabId + '"][data-toggle="tab"]').parent().find('i');

            // Add custom class to tab containing the field
            if (data.status == validator.STATUS_INVALID) {
                $icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
            } else if (data.status == validator.STATUS_VALID) {
                var isValidTab = validator.isValidContainer($tabPane);
                $icon.removeClass(faIcon.valid).addClass(isValidTab ? faIcon.valid : faIcon.invalid);
            }
        }
    });

    //编辑时不验证
    var id = AppUtils.analyseUrlParameter().id;
    if (id == undefined) {

        // FORM VALIDATION ON ACCORDION
        // =================================================================
        $('#demo-bv-accordion').bootstrapValidator({
            message: '输入值是无效的',
            excluded: ':disabled',
            feedbackIcons: faIcon,
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {
                            message: '姓名不可为空'
                        },
                        regexp: {
                            regexp: /[\u4e00-\u9fa5]/,
                            message: '姓名应为中文'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {
                            message: '姓名不可为空'
                        },
                        regexp: {
                            regexp: /[\u4e00-\u9fa5]/,
                            message: '姓名应为中文'
                        }
                    }
                },
                username: {
                    message: '用户名是无效的',
                    validators: {
                        notEmpty: {
                            //message: 'The username is required and cannot be empty'
                            message: '用户名是必须的，不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 30,
                            //message: 'The username must be more than 4 and less than 30 characters long'
                            message: '用户名必须大于4，小于30个字符'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            //message: 'The username can only consist of alphabetical, number, dot and underscore'
                            message: '用户名只能由字母、数字、点和下划线组成'
                        },
                        different: {
                            field: 'password',
                            //message: 'The username and password cannot be the same as each other'
                            message: '用户名和密码不可相同'
                        },
                        remote: {
                            url: "checkUsername",     //后台处理程序
                            type: "post",  //数据发送方式
                            data: {   //要传递的数据
                                username: function () {
                                    return $("input[name='username']").val();
                                }
                            },
                            message: '用户名已被占用'

                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            //message: 'The email address is required and cannot be empty'
                            message: '邮件地址是必须的，不能为空'
                        },
                        emailAddress: {
                            //message: 'The input is not a valid email address'
                            message: '输入的不是有效的邮件地址'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            //message: 'The password is required and cannot be empty'
                            message: '密码是必须的，不能为空'
                        },
                        different: {
                            field: 'username',
                            //message: 'The password cannot be the same as username'
                            message: '用户名和密码不可相同'
                        }
                    }
                },
                gender: {
                    validators: {
                        notEmpty: {
                            //message: 'The gender is required'
                            message: '请选择性别'
                        }
                    }
                },
                bio: {
                    validators: {
                        notEmpty: {
                            //message: 'The bio is required and cannot be empty'
                            message: '个人简历是必须的，不能为空'
                        },
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {
                            //message: 'The phone number is required and cannot be empty'
                            message: '手机号码是必须的，不能为空'
                        },
                        /*digits: {
                            //message: 'The value can contain only digits'
                            message: '手机号码只能由数字组成'
                        }*/
                        regexp: {
                            regexp: /^1[34578]\d{9}$/,
                            //message: 'The username can only consist of alphabetical, number, dot and underscore'
                            message: '手机号码有误，请重新输入'
                        },
                    }
                },
                city: {
                    validators: {
                        notEmpty: {
                            //message: 'The city is required and cannot be empty'
                            message: '所在城市是必须的，不能为空'
                        },
                    }
                }/*,
		avatar:{
			validators: {
				file: {
	                extension: 'png,jpg,jpeg',
	                type: 'image/png,image/jpg,image/jpeg',
	                message: '请重新选择图片'
	            }
			}
		}*/
            }
        }).on('status.field.bv', function (e, data) {
            var $form = $(e.target),
                validator = data.bv,
                $collapsePane = data.element.parents('.collapse'),
                colId = $collapsePane.attr('id');

            if (colId) {
                var $anchor = $('a[href="#' + colId + '"][data-toggle="collapse"]');
                var $icon = $anchor.find('i');

                // Add custom class to panel containing the field
                if (data.status == validator.STATUS_INVALID) {
                    $anchor.addClass('bv-col-error');
                    $icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
                } else if (data.status == validator.STATUS_VALID) {
                    var isValidCol = validator.isValidContainer($collapsePane);
                    if (isValidCol) {
                        $anchor.removeClass('bv-col-error');
                    } else {
                        $anchor.addClass('bv-col-error');
                    }
                    $icon.removeClass(faIcon.valid + " " + faIcon.invalid).addClass(isValidCol ? faIcon.valid : faIcon.invalid);
                }
            }
        });


    }
    // FORM VALIDATION CUSTOM ERROR CONTAINER
    // =================================================================
    // Indicate where the error messages are shown.
    // Tooltip, Popover, Custom Container.
    // =================================================================
    $('#demo-bv-errorcnt').bootstrapValidator({
        message: 'This value is not valid',
        excluded: [':disabled'],
        feedbackIcons: faIcon,
        fields: {
            name: {
                container: 'tooltip',
                validators: {
                    notEmpty: {
                        message: 'The first name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[A-Z\s]+$/i,
                        message: 'The first name can only consist of alphabetical characters and spaces'
                    }
                }
            },
            lastName: {
                validators: {
                    notEmpty: {
                        message: 'The last name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[A-Z\s]+$/i,
                        message: 'The last name can only consist of alphabetical characters and spaces'
                    }
                }
            },
            email: {
                container: 'tooltip',
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            username: {
                container: 'popover',
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
            },
            password: {
                container: 'popover',
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            phoneNumber: {
                container: '#demo-error-container',
                validators: {
                    notEmpty: {
                        message: 'The phone number is required and cannot be empty'
                    },
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
            city: {
                container: '#demo-error-container',
                validators: {
                    notEmpty: {
                        message: 'The city is required and cannot be empty'
                    },
                }
            }
        }
    }).on('status.field.bv', function (e, data) {
        var $form = $(e.target),
            validator = data.bv,
            $tabPane = data.element.parents('.tab-pane'),
            tabId = $tabPane.attr('id');

        if (tabId) {
            var $icon = $('a[href="#' + tabId + '"][data-toggle="tab"]').parent().find('i');
            // Add custom class to tab containing the field
            if (data.status == validator.STATUS_INVALID) {
                $icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
            } else if (data.status == validator.STATUS_VALID) {
                var isValidTab = validator.isValidContainer($tabPane);
                $icon.removeClass(faIcon.valid).addClass(isValidTab ? faIcon.valid : faIcon.invalid);
            }
        }
    });


    // FORM VARIOUS VALIDATION
    // =================================================================
    $('#demo-bvd-notempty').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: faIcon,
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required.'
                    }
                }
            },
            acceptTerms: {
                validators: {
                    notEmpty: {
                        message: 'You have to accept the terms and policies'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            member: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required'
                    }
                }
            },
            'programs[]': {
                validators: {
                    choice: {
                        min: 2,
                        max: 4,
                        message: 'Please choose 2 - 4 programming languages you are good at'
                    }
                }
            },
            integer: {
                validators: {
                    notEmpty: {
                        message: 'The number is required and can\'t be empty'
                    },
                    integer: {
                        message: 'The value is not a number'
                    }
                }
            },
            numeric: {
                validators: {
                    notEmpty: {
                        message: 'The number is required and can\'t be empty'
                    },
                    numeric: {
                        message: 'The value is not a number'
                    }
                }
            },
            greaterthan: {
                validators: {
                    notEmpty: {
                        message: 'The number is required and can\'t be empty'
                    },
                    greaterThan: {
                        inclusive: false,
                        //If true, the input value must be greater than or equal to the comparison one.
                        //If false, the input value must be greater than the comparison one
                        value: 50,
                        message: 'Please enter a value greater than 50'
                    }
                }
            },
            lessthan: {
                validators: {
                    notEmpty: {
                        message: 'The number is required and can\'t be empty'
                    },
                    lessThan: {
                        inclusive: false,
                        //If true, the input value must be less than or equal to the comparison one.
                        //If false, the input value must be less than the comparison one
                        value: 25,
                        message: 'Please enter a value less than 25'
                    }
                }
            },
            range: {
                validators: {
                    inclusive: true,
                    notEmpty: {
                        message: 'The number is required and can\'t be empty'
                    },
                    between: {
                        min: 1,
                        max: 100,
                        message: 'Please enter a number between 1 and 100'
                    }
                }
            },
            uppercase: {
                validators: {
                    notEmpty: {
                        message: 'The card holder is required and can\'t be empty'
                    },
                    // Since case is a Javascript keyword,
                    // you should place it between quotes (like 'case' or "case")
                    // to make it work in all browsers
                    stringCase: {
                        message: 'The card holder must be in uppercase',
                        'case': 'upper'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            website: {
                validators: {
                    notEmpty: {
                        message: 'The website address is required and can\'t be empty'
                    },
                    uri: {
                        allowLocal: false,
                        message: 'The input is not a valid URL'
                    }
                }
            },
            color: {
                validators: {
                    notEmpty: {
                        message: 'The hex color is required and can\'t be empty'
                    },
                    hexColor: {
                        message: 'The input is not a valid hex color'
                    }
                }
            }
        }
    }).on('success.field.bv', function (e, data) {
        // $(e.target)  --> The field element
        // data.bv      --> The BootstrapValidator instance
        // data.field   --> The field name
        // data.element --> The field element

        var $parent = data.element.parents('.form-group');

        // Remove the has-success class
        $parent.removeClass('has-success');
    });


    // MASKED INPUT
    // =================================================================
    // Require Masked Input
    // http://digitalbush.com/projects/masked-input-plugin/
    // =================================================================


    // Initialize Masked Inputs
    // a - Represents an alpha character (A-Z,a-z)
    // 9 - Represents a numeric character (0-9)
    // * - Represents an alphanumeric character (A-Z,a-z,0-9)
    $('#demo-msk-date').mask('99/99/9999');
    $('#demo-msk-date2').mask('99-99-9999');
    $('#demo-msk-phone').mask('(999) 999-9999');
    $('#demo-msk-phone-ext').mask('(999) 999-9999? x99999');
    $('#demo-msk-taxid').mask('99-9999999');
    $('#demo-msk-ssn').mask('999-99-9999');
    $('#demo-msk-pkey').mask('a*-999-a999');


});
