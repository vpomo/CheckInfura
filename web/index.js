var decimalToken = 1e18;
var gasPriceGwei = 10 * 1e9; //10 GWEY
var gasLimit = 4600000;
var idWordpress = 2;

$(document).ready(function () {

    getAddressWallet();
});

function getAddressWallet(){
	$.ajax({
		  url: "http://localhost:8080/api/wallet",
		  type: "get", 
		  data: { 
				idWordpress: idWordpress
		  },
		  success: function(response) {
				$('#addressWallet').html(response.addressWallet);
				return response.addressWallet;
		  },
		  error: function(xhr) {
				console.log("GET Not request - http://localhost:8080/api/wallet");
		  }
	});
}

function getTaskHistory(){
	$.ajax({
		  url: "http://localhost:8080/api/task/all/" + idWordpress,
		  type: "get", 
		  success: function(response) {
			  console.log(response);
				return response;
		  },
		  error: function(xhr) {
				console.log("GET Not request - http://localhost:8080/api/task/history/");
		  }
	});
}

function createWallet() {
	var sendData = { 
				idWordpress: idWordpress
		  };
	$.ajax({
		url : "http://localhost:8080/api/wallet/",
		type : "POST",
		data: JSON.stringify(sendData),
        contentType: "application/json; charset=utf-8",
		traditional: true,
		success: function(response) {
			  console.log("Success");
		  },
		error: function(xhr) {
			  console.log("Error");
		  }
	});
}

function createTask() {
	var sendData = { 
				idWordpress: idWordpress
		  };
	$.ajax({
		url : "http://localhost:8080/api/task/",
		type : "POST",
		data: JSON.stringify(sendData),
        contentType: "application/json; charset=utf-8",
		traditional: true,
		success: function(response) {
			  console.log("Success");
		  },
		error: function(xhr) {
			  console.log("Error");
		  }
	});
}