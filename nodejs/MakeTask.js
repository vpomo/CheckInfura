var fp = require("./AsyncParser");
var postgres = require("./Postgre");

var idTask = process.argv[2];
var idWallet = process.argv[3];
var sizePackage = 40;

(async () => {
	console.log("idTask = " + idTask + "idWallet = " + idWallet);
	var fromFile = await fp.readFile("./distribution.csv", idTask, sizePackage, idWallet);
	console.log("Updating status for task: " + idTask);
        await postgres.setStatusTaskHistory(idTask, "MAKED");

})();