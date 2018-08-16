var server = require("./Server");
var fp = require("./AsyncParser");
var postgres = require("./Postgre");
//var infura = require("./Infura");
var processTransfer = require("./ProcessTransfer");

/**
 * Initializing Variables
 */
var idTask = "scscksklcsl-ssfsdfs";
var myWallet = '0x5a204d1ca98e8de8566b20951e55f9d710e65947';
var sizePackage = 40;
var decimalToken = 1e18;

//postgres.putTransferHistory(23.67, 3, idTask, []);

//server.startHttpServer();

(async () => {
    //var fromFile = await fp.readFile("./distribution.csv", idTask, sizePackage);

    /*
    var res = await postgres.getCountTimes(idTask);
    var countTransfers = JSON.stringify(res);
    console.log("res = " + JSON.stringify(res) + "  count = " + );
    console.log('Ron once said,');
*/
    var result = await processTransfer.batchTransfer(idTask, myWallet, sizePackage);
    //console.log("result transfer = " + result)

})();