var server = require("./Server");
var fp = require("./AsyncParser");
var postgres = require("./Postgre");
//var infura = require("./Infura");
var processTransfer = require("./ProcessTransfer");

/**
 * Initializing Variables
 */
var idTask = process.argv[2];
var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';
var sizePackage = 40;
var decimalToken = 1e18;

//postgres.putTransferHistory(23.67, 3, idTask, []);

//server.startHttpServer();

(async () => {
console.log("idTask = " + idTask);
    var fromFile = await fp.readFile("./distribution.csv", idTask, sizePackage);

    //await postgres.deleteTrasferHistory(idTask);

   // await postgres.setEnableTask(idTask, true);
//    var result = await processTransfer.batchTransfer(idTask, myWallet, sizePackage, decimalToken);
//    console.log("result = " + result);
//    await postgres.setEnableTask(idTask, false);
//    console.log("Work is done ...");

})();