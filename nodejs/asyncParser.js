var postgres = require("./postgre");

var fs = require('fs');
var parse = require('csv-parse');

module.exports.readCsvFile = function (nameFile, idTask) {
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
            postgres.putCsvFromFile(csvData,idTask);

            resultParse = csvData;
        });
}
