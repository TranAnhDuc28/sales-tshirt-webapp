function Validation(formSelector) {
    var _this = this;
    var formRules = {};

    // Lấy ra form element trong DOM theo 'formSelector'
    var formElement = document.querySelector(formSelector);

    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }

    /**
     * Quy ước tạo rule
     * - Nếu có lỗi thì return `error message`
     * - Nếu không có lỗi thì return `undefined`
     */
    var validatorRules = {
        required: function (value) {
            return (value && value.trim().length !== 0) ? undefined : `Vui lòng nhập/chọn dữ liệu trường này`;
        },
        email: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : `Vui lòng nhập email`;
        },
        phone_number: function (value) {
            var regex = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
            return regex.test(value) ? undefined : `Vui lòng nhập nhập số điện thoại`;
        },
        min: function (min) {
            return function (value) {
                return value.length >= min ? undefined : `Vui lòng nhập ít nhất ${min} ký tự`;
            }
        },
        max: function (max) {
            return function (value) {
                return value.length <= max ? undefined : `Vui lòng nhập ít nhất ${max} ký tự`;
            }
        },
        quality: function (value) {
            return Number.parseInt(value) > 0 ? undefined : `Số lượng phải lớn hơn 0`;
        },
        price: function (value) {
            return Number.parseFloat(value) > 0 ? undefined : `Giá tiền phải lớn hơn 0`;
        }
    };

    // Chỉ xử lý khi có element trong DOM
    if (formElement) {
        var inputs = formElement.querySelectorAll('input[name][rules]');
        var selects = formElement.querySelectorAll('select[name][rules]');
        console.log(selects)
        if (inputs) {
            for (var input of inputs) {
                var rules = input.getAttribute('rules').split('|');
                for (var rule of rules) {
                    var ruleInfo;
                    var isRuleHasValue = rule.includes(':');

                    if (isRuleHasValue) {
                        ruleInfo = rule.split(':');
                        rule = ruleInfo[0];
                    }

                    var ruleFunc = validatorRules[rule];
                    if (isRuleHasValue) {
                        ruleFunc = ruleFunc(ruleInfo[1]);
                    }

                    if (Array.isArray(formRules[input.name])) {
                        formRules[input.name].push(ruleFunc);
                    } else {
                        formRules[input.name] = [ruleFunc];
                    }
                }

                // lắng nghe sự kiện để validate (blur, change, ...)
                input.onblur = handleValidate;
                input.oninput = handleClearError;
            }
        }

        if (selects) {
            for (var select of selects) {
                var rules = select.getAttribute('rules').split('|');
                for (var rule of rules) {
                    var ruleInfo;
                    var isRuleHasValue = rule.includes(':');

                    if (isRuleHasValue) {
                        ruleInfo = rule.split(':');
                        rule = ruleInfo[0];
                    }

                    var ruleFunc = validatorRules[rule];
                    if (isRuleHasValue) {
                        ruleFunc = ruleFunc(ruleInfo[1]);
                    }

                    if (Array.isArray(formRules[select.name])) {
                        formRules[select.name].push(ruleFunc);
                    } else {
                        formRules[select.name] = [ruleFunc];
                    }
                }
                select.onchange = function (event) {
                    console.log(event.target.value)
                    if (event.target.value === "") {
                        handleValidate(event);
                    } else {
                        handleClearError(event);
                    }
                }
            }
        }


        function handleValidate(event) {
            var rules = formRules[event.target.name];
            var errorMessage;
            for (var rule of rules) {
                errorMessage = rule(event.target.value);
                if (errorMessage) break;
            }

            // Nếu có lỗi thì hiển thị lỗi ra UI
            if (errorMessage) {
                var formGroup = getParent(event.target, '.form-group');
                if (formGroup) {
                    formGroup.classList.add('invalid')
                    var formMessage = formGroup.querySelector('.form-message');
                    if (formMessage) {
                        formMessage.innerText = errorMessage;
                    }
                }
            }
            return !errorMessage;
        }

        // Hàm clear error message
        function handleClearError(event) {
            var formGroup = getParent(event.target, '.form-group');
            if (formGroup.classList.contains('invalid')) {
                formGroup.classList.remove('invalid');
                var formMessage = formGroup.querySelector('.form-message');
                if (formMessage) {
                    formMessage.innerText = '';
                }
            }
        }

        // Xử lý hành vi submit form
        formElement.onsubmit = function (event) {
            event.preventDefault();

            var inputs = formElement.querySelectorAll('input[name][rules]');
            var selects = formElement.querySelectorAll('select[name][rules]');
            var isValid = true;

            if (inputs) {
                for (var input of inputs) {
                    if (!handleValidate({target: input})) {
                        isValid = false;
                    }
                }
            }
            if (selects) {
                for (var select of selects) {
                    if (!handleValidate({target: select})) {
                        isValid = false;
                    }
                }
            }

            // Khi không có lỗi thì submit form
            if (isValid) {
                if (typeof _this.onSubmit === 'function') {
                    var enableInputs = formElement.querySelectorAll('[name]');
                    var formValues = Array.from(enableInputs).reduce(function (values, input) {
                        switch (input.type) {
                            case 'radio':
                                values[input.name] = formElement.querySelector('input[name="' + input.name + '"]:checked').value;
                                break;
                            case 'checkbox':
                                if (!input.matches(':checked')) {
                                    values[input.name] = '';
                                    return values;
                                }
                                if (!Array.isArray(values[input.name])) {
                                    values[input.name] = [];
                                }
                                values[input.name].push(input.value);
                                break;
                            case 'file':
                                values[input.name] = input.files;
                                break;
                            default:
                                values[input.name] = input.value.trim();
                        }

                        return values;
                    }, {});

                    // Gọi lại hàm onSubmit và trả về kèm giá trị của form
                    _this.onSubmit(formValues);
                } else {
                    formElement.submit();
                }
            }
        }
        console.log(formRules)
    }
}

var formCreateKT = new Validation('#form-create-kt');
// form.onSubmit = function (formData) {
//     console.log(formData)
// }
var formUpdateKT = new Validation('#form-update-kt');

var formCreateMS = new Validation('#form-create-ms');
var formUpdateMS = new Validation('#form-update-ms');

var formCreateKH = new Validation('#form-create-kh');
var formUpdateKH = new Validation('#form-update-kh');

var formCreateNV = new Validation('#form-create-nv');
var formUpdateNV = new Validation('#form-update-nv');

var formCreateSP = new Validation('#form-create-sp');
var formUpdateSP = new Validation('#form-update-sp');

var formCreateSPCT = new Validation('#form-create-spct');
var formUpdateSPCT = new Validation('#form-update-spct');

var formCreateHD = new Validation('#form-create-hd');
var formUpdateHD = new Validation('#form-update-hd');

var formCreateHDCT = new Validation('#form-create-hdct');
var formUpdateHDCT = new Validation('#form-update-hdct');

