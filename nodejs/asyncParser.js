var fs = require('fs');
var parse = require('csv-parse');
var resultParse;

module.exports.result = resultParse;

module.exports.readCsvFile = function (nameFile) {
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
            resultParse = csvData;
        });
}

module.exports.rr = function () {
    return resultParse;
}
