function ajaxCall(url, params, successFunction, errorFunction, async) {
    if (async == undefined) async = true;
    $.ajax({
        cache : false,
        type : "POST",
        url : url,
        data : params,
        async : async,
        dataType : 'json',
        contentType : "application/x-www-form-urlencoded; charset=UTF-8", // AJAX contentType
        success : function(result) {
            if (typeof (successFunction) == 'function'){
                successFunction(result);
            }
        },
        error : function(xhr, status, error) {
            alert("시스템 오류가 발생하였습니다");
            if (typeof (errorFunction) == 'function'){
                errorFunction();
            }
            return;
        }
    });
}
/* 팝업호출모듈 */
function callPopUp(url, w, h, s, target) {
    var l, t, objPopup
    if (target == 'undefined' || target == '' || target == null) {
        var target = 'win1';
    }

    l = (screen.width - w) / 2;
    t = (screen.height - h) / 2;

    if (s == 1 || s == "Y")
        objPopup = window.open(url, target, 'width=' + w + ',height=' + h + ',left=' + l + ',top=' + t + ',resizable=0,scrollbars=1');
    else if (s == 2)
        objPopup = window.open(url, target, 'width=' + w + ',height=' + h + ',left=' + l + ',top=' + t + ',resizable=1,scrollbars=1');
    else if (s == "" || s == 0 || s == "N" || !s || s == "0")
        objPopup = window.open(url, target, 'width=' + w + ',height=' + h + ',left=' + l + ',top=' + t + ',resizable=0,scrollbars=0,status=0');
    else
        objPopup = window.open(url, target, 'width=' + w + ',height=' + h + ',left=' + l + ',top=' + t + ',resizable=1,menubar=1,toolbar=1,scrollbars=1,status=1');
    if (objPopup == null) {
        alert("차단된 팝업창을 허용해 주십시오.");
    }
    return objPopup;
}