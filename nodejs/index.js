var server = require("./server");
var fp = require("./asyncParser");
var postgres = require("./postgre");
var infura = require("./infura");

var idTask = "scscksklcsl-ssfsdfs";
var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';


//console.log("balanceOfToken = " + infura.balanceOfToken(myWallet));
//console.log("balanceOfEther = " + infura.balanceOfEther(myWallet));

var fromFile = fp.readCsvFile("distribution.csv", idTask);
//var result = postgres.getCsvFromDB(idTask);
//console.log("result = " + result);

//server.startHttpServer();
