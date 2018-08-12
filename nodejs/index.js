var server = require("./server");
var fp = require("./asyncParser");

var fromFile = fp.readCsvFile("myfile.csv");
console.log(fp.result);
console.log(fp.rr());
server.startHttpServer();
