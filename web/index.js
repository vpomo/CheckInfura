var decimalToken = 1e18;
var gasPriceGwei = 10 * 1e9; //10 GWEY
var gasLimit = 4600000;
var idWordpress = 2;

$(document).ready(function () {

    getAddressWallet();
});

function createWallet(callbackfunction) {
        var url = "http://localhost:8080/api/wallet/";
        var args = {"idWordpress": idWordpress};
        $.post(url, args, function (data) {
			getAddressWallet();
            console.log(data);
            var goodsSpecs = data.goodsSpecs;
            if (callbackfunction != undefined) {
                callbackfunction();
            }
        });
}

function getAddressWallet(){
	$.ajax({
		  url: "http://localhost:8080/api/wallet",
		  type: "get", //send it through get method
		  data: { 
				idWordpress: idWordpress
		  },
		  success: function(response) {
				$('#addressWallet').html(response);
				return response;
		  },
		  error: function(xhr) {
				console.log("GET Not request - http://localhost:8080/api/wallet");
		  }
	});
}