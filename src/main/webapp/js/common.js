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
function getCode(){

}