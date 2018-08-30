var postgres = require("./Postgre");
var fp = require("./AsyncParser");
var infura = require("./Infura");

module.exports.batchTransfer = async function(idTask, myWallet, sizePackage, decimalToken) {
    console.log("Run batch transfering ...");
    sleep(2000);
    var paramsTask = await postgres.getTask(idTask);
    var allTokens = Number(paramsTask[0].amount_token).toFixed(18);
    var numberTimes = Number(paramsTask[0].number_times);
    var realNumberTimes = Number(paramsTask[0].real_number_times);
    var remainToken = Number(paramsTask[0].remain_number);
    var activeTask = paramsTask[0].active_task;
    var current_progress = 0;

    //var walletTokens = infura.balanceOfToken(myWallet);

    //console.log("allTokens = " + allTokens + " numberTimes = " + numberTimes + " remainToken = " + remainToken);
    //console.log(" walletTokens = " + walletTokens);

    var step = await getStep(idTask);

    var csvFromDb = await postgres.getCsvFromDB(idTask);
    var csvJson = JSON.parse(csvFromDb[0].from_csv);

    var currentArrayAddresses;
    var currentArrayValues;
    var resultSending;

    while (activeTask && step < realNumberTimes) {
    var step = await getStep(idTask);

/*
        if (step == numberTimes) {
            step++;
        }
*/


        if (step < numberTimes) {
            console.log("step(0) = " + step);
            /*
                        contract.batchTransfer(convertCsvToAddress(step*sizePackage, sizePackage),convertCsvToValue(step*sizePackage, sizePackage), function(error, data) {
                            console.log("data = " + data);
                        });
            */
            //console.log("step*sizePackage=" + step * sizePackage + " sizePackage" + sizePackage);
            currentArrayAddresses = convertCsvToAddress(step * sizePackage, sizePackage, csvJson);
            currentArrayValues = convertCsvToValue(step * sizePackage, sizePackage, csvJson, decimalToken);
            await infura.sendToken(myWallet, step, idTask, currentArrayAddresses);
            current_progress = (step  / realNumberTimes) * 100;
            setProgressCount(current_progress);

        }

        if (realNumberTimes > numberTimes && step == numberTimes) {
            console.log("step(1) = " + step);
            //step++;
            //console.log("numberTimes*sizePackage=" + numberTimes * sizePackage + " remainToken=" + remainToken);
            currentArrayAddresses = convertCsvToAddress(numberTimes * sizePackage, remainToken, csvJson);
            currentArrayValues = convertCsvToValue(numberTimes * sizePackage, remainToken, csvJson, decimalToken);
            resultSending = await infura.sendToken(myWallet, step, idTask, currentArrayAddresses);
/*
            contract.batchTransfer(convertCsvToAddress(numberTimes*sizePackage, remainToken),convertCsvToValue(numberTimes*sizePackage, remainToken), function(error, data) {
                console.log("data = " + data);
            });
*/
            current_progress = (step  / realNumberTimes) * 100;
            setProgressCount(current_progress);
            sleep(2000);
        }
        paramsTask = await postgres.getTask(idTask);
        activeTask = paramsTask[0].active_task;
        sleep(2000);
        console.log("Current step done");
    }
    current_progress = 100;
    setProgressCount(current_progress);
    return true;
};

async function getStep(idTask) {
    var result = await postgres.getCountTimes(idTask);
    return result[0].count;
}

function convertCsvToAddress(position, numberAdresses, fromCsv) {
    //console.log("transfering adresses:");
    var arrayAdresses = [];
    for (var i = position; i < position + numberAdresses; i++) {
        arrayAdresses.push(fromCsv[i].address);
    }
    return arrayAdresses;
}


function convertCsvToValue(position, numberValues, fromCsv, decimalToken) {
    //console.log("transfering values:");
    var arrayValues = [];
    for (var i = position; i < position + numberValues; i++) {
        arrayValues.push(Number(fromCsv[i].value * decimalToken));
        //console.log("i=" + i + " value=" + Number(fromCsv[i].value * decimalToken) + "\n");
    }
    return arrayValues;
}

function setProgressCount(countProgress) {
    console.log("countProgress = " + countProgress.toFixed(2));
    if (countProgress > 99.999) {
        console.log("countProgress = done !!!");
    }
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds){
            break;
        }
    }
}