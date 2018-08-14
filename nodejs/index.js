var server = require("./Server");
var fp = require("./AsyncParser");
var postgres = require("./Postgre");
//var infura = require("./Infura");
var processTransfer = require("./ProcessTransfer");
var idTask = "scscksklcsl-ssfsdfs";
var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';


//console.log("balanceOfToken = " + infura.balanceOfToken(myWallet));
//console.log("balanceOfEther = " + infura.balanceOfEther(myWallet));

//var fromFile = fp.readCsvFile("distribution.csv", idTask);
//postgres.putTransferHistory(23.67, 3, idTask, []);
//postgres.countTaskTimes(idTask);

//var result = postgres.getCsvFromDB(idTask);
//console.log("result = " + result);

//server.startHttpServer();

(async () => {
/*
    var res = await postgres.getCountTimes(idTask);
    var countTransfers = JSON.stringify(res);
    console.log("res = " + JSON.stringify(res) + "  count = " + );
    console.log('Ron once said,');
*/
    var result = await processTransfer.batchTransfer(idTask);
    console.log("result transfer = " + result)

})();