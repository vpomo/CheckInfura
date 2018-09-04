var fp = require("./AsyncParser");
var postgres = require("./Postgre");

var idTask = process.argv[2];
var sizePackage = 40;

(async () => {
	console.log("idTask = " + idTask);
	var fromFile = await fp.readFile("./distribution.csv", idTask, sizePackage);
	console.log("Updating status for task: " + idTask);
        await postgres.setStatusTaskHistory(idTask, "MAKED");

})();