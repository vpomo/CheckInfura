var postgres = require("./Postgre");

var fs = require('fs');
var parse = require('csv-parse');
var csv = require("csvtojson");

module.exports.readCsvFile = function (nameFile, idTask, sizePackage, idWallet) {
    var csvData = [];
    console.log("readCsvFile[idWallet]-1 = " + idWallet);
    fs.createReadStream(nameFile)
        .pipe(parse({delimiter: ','}))
        .on('data', function (csvrow) {
            //console.log(csvrow);
            //do something with csvrow
            csvData.push(csvrow);
        })
        .on('end', function () {
            //do something wiht csvData
            console.log("readCsvFile[idWallet]-2 = " + idWallet);
            postgres.putCsvFromFile(csvData,idTask, sizePackage, idWallet);
            resultParse = csvData;
        });
}

module.exports.readFile = async function (nameFile, idTask, sizePackage, idWallet) {
	console.log("Start parsing csv-file ...");
        var csvData = await csv().fromFile(nameFile);
        postgres.putCsvFromFile(csvData,idTask, sizePackage, idWallet);
	console.log("Updating status for task: " + idTask);
        await postgres.setStatusTaskHistory(idTask, "MAKED");
}
