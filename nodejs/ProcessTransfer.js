var postgres = require("./Postgre");
var fp = require("./AsyncParser");

//var infura = require("./Infura");

module.exports.batchTransfer = async function(idTask, myWallet, sizePackage) {
    console.log("Run batch transfering ...");
    var paramsTask = await postgres.getTask(idTask);
    var allTokens = Number(paramsTask[0].amount_token).toFixed(18);
    var numberTimes = Number(paramsTask[0].number_times);
    var realNumberTimes = Number(paramsTask[0].real_number_times);
    var remainToken = Number(paramsTask[0].remain_token).toFixed(0);
    var activeTask = paramsTask[0].active_task;
    var current_progress = 0;

    //var walletTokens = infura.balanceOfToken(myWallet);

    console.log("allTokens = " + allTokens + " numberTimes = " + numberTimes + " remainToken = " + remainToken);
    //console.log(" walletTokens = " + walletTokens);

    var step = await getStep(idTask);

    var csvFromDb = await postgres.getCsvFromDB(idTask);
    var csvJson = JSON.parse(csvFromDb[0].from_csv);

    var currentArrayAddresses;

    while (activeTask && step <= realNumberTimes) {
    var step = await getStep(idTask);
    console.log("step = " + step);
        if (step == numberTimes) {
            step++;
        }

        if (step < numberTimes) {
            console.log("step*sizePackage=" + step * sizePackage + " sizePackage" + sizePackage);
            currentArrayAddresses = convertCsvToAddress(step * sizePackage, sizePackage, csvJson);
            //console.log("currentArrayAddresses = " + currentArrayAddresses);
            //convertCsvToValue(step * sizePackage, sizePackage);
/*
            contract.batchTransfer(convertCsvToAddress(step*sizePackage, sizePackage),convertCsvToValue(step*sizePackage, sizePackage), function(error, data) {
                console.log("data = " + data);
            });
*/
            await postgres.putTransferHistory(100, numberTimes, idTask, currentArrayAddresses);
            current_progress = ((step + 1) * sizePackage / csvJson.length) * 100;
            setProgressCount(current_progress);
            step++;
        }

        if (realNumberTimes > numberTimes && step == numberTimes + 1) {
            console.log("numberTimes*sizePackage=" + numberTimes * sizePackage + " remainToken=" + remainToken);
            currentArrayAddresses = convertCsvToAddress(numberTimes * sizePackage, remainToken-1, csvJson);
            //console.log("currentArrayAddresses = " + currentArrayAddresses);
            //convertCsvToValue(numberTimes * sizePackage, remainToken);
/*
            contract.batchTransfer(convertCsvToAddress(numberTimes*sizePackage, remainToken),convertCsvToValue(numberTimes*sizePackage, remainToken), function(error, data) {
                console.log("data = " + data);
            });
*/
            await postgres.putTransferHistory(100, numberTimes, idTask, currentArrayAddresses);
            current_progress = 100;
            setProgressCount(current_progress);
        }
        paramsTask = await postgres.getTask(idTask);
        activeTask = paramsTask[0].active_task;
    }
    return true;
};

async function getStep(idTask) {
    var result = await postgres.getCountTimes(idTask);
    return result[0].count;
}

function convertCsvToAddress(position, numberAdresses, fromCsv) {
    console.log("transfering adresses:");
    var arrayAdresses = [];
    for (var i = position; i < position + numberAdresses; i++) {
        console.log("i=" + i);
        arrayAdresses.push(fromCsv[i].address);
        console.log("i=" + i + " address=" + fromCsv[i].address + "\n");
    }
    return arrayAdresses;
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

function setProgressCount(countProgress) {
    console.log("countProgress = " + countProgress.toFixed(2));
    if (countProgress > 99.999) {
        console.log("countProgress = done !!!");
    }
}
