var postgres = require("./Postgre");

var fs = require('fs');
var parse = require('csv-parse');
var csv = require("csvtojson");

module.exports.readCsvFile = function (nameFile, idTask, sizePackage) {
    var csvData = [];
    fs.createReadStream(nameFile)
        .pipe(parse({delimiter: ','}))
        .on('data', function (csvrow) {
            //console.log(csvrow);
            //do something with csvrow
            csvData.push(csvrow);
        })
        .on('end', function () {
            //do something wiht csvData
            //console.log(csvData);
            postgres.putCsvFromFile(csvData,idTask, sizePackage);
            resultParse = csvData;
        });
}

module.exports.readFile = async function (nameFile, idTask, sizePackage) {
	console.log("Start parsing csv-file ...");
    var csvData = await csv().fromFile(nameFile);
    postgres.putCsvFromFile(csvData,idTask, sizePackage);
}

module.exports.readStream = async function (nameStream) {
    console.log("Start parsing csv-stream ...");
    var csvData = await csv({output:"json"}).fromStream(nameStream);
    return csvData;
}
