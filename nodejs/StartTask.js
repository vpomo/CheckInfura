var server = require("./Server");
var postgres = require("./Postgre");
//var infura = require("./Infura");
var processTransfer = require("./ProcessTransfer");

/**
 * Initializing Variables
 */
var sizePackage = 40;
var decimalToken = 1e18;

var idTask = process.argv[2];
var myWallet = process.argv[3];;
//var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';

//postgres.putTransferHistory(23.67, 3, idTask, []);

//server.startHttpServer();

(async () => {
console.log("idTask = " + idTask);
console.log("myWallet = " + myWallet);
/*
    await postgres.deleteTrasferHistory(idTask);

    await postgres.setEnableTask(idTask, true);
    var result = await processTransfer.batchTransfer(idTask, myWallet, sizePackage, decimalToken);
    console.log("result = " + result);
    await postgres.setEnableTask(idTask, false);
    console.log("Work is done ...");
*/

})();