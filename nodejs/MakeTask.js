var fp = require("./AsyncParser");

var idTask = process.argv[2];
var sizePackage = 40;

(async () => {
	console.log("idTask = " + idTask);
	var fromFile = await fp.readFile("./distribution.csv", idTask, sizePackage);
})();