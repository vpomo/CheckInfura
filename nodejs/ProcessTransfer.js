var postgres = require("./Postgre");


module.exports.batchTransfer = async function(idTask) {
    console.log("Run batch transfering ...");
    var paramsTask = await postgres.getTask(idTask);
    var allTokens = Number(paramsTask[0].amount_token).toFixed(18);
    var numberTimes = Number(paramsTask[0].all_number_times);

    console.log("allTokens = " + allTokens + " numberTimes = " + numberTimes);


    var csvFromDb = await postgres.getCsvFromDB(idTask);

    return csvFromDb;
};

function convertCsvToAddress(position, numberAdresses) {
    console.log("transfering adresses:");
    var arrayAdresses = [];
    for (var i = position; i < position + numberAdresses; i++) {
        arrayAdresses.push(fromCsv[i].address.toString());
        console.log("i=" + i + " address=" + fromCsv[i].address.toString() + "\n");
    }
    $('#lastAddress').html(fromCsv[i-1].address);
    return arrayAdresses
}


function convertCsvToValue(position, numberValues) {
    console.log("transfering values:");
    var arrayValues = [];
    for (var i = position; i < position + numberValues; i++) {
        arrayValues.push(Number(fromCsv[i].value * decimalToken));
        console.log("i=" + i + " value=" + Number(fromCsv[i].value * decimalToken) + "\n");
    }
    return arrayValues;
}
