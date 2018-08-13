//https://github.com/vitaly-t/pg-promise/wiki/Learn-by-Example#simple-select
//https://rage.mp/forums/topic/202-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D0%B5%D0%BC-%D1%81-postgresql/
var BigNumber = require('big-number');
var pgp = require("pg-promise")(/*options*/);
const cn = {
    host: 'localhost',
    port: 5439,
    database: 'tokendb',
    user: 'token',
    password: 'rfhnjafy'
};
var db = pgp(cn);
var sizePackage = 40;

module.exports.putCsvFromFile = function (csvData, idTask) {
    var currentDate = new Date();
    var numberTimes;
    var remain;
    var realNumberTimes;
    var fromCsv;
    //console.log("csvData = " + csvData);
    var sentTokens = getAmountTokens(csvData);

    console.log("Put data from csv-file ...");
    fromCsv = csvData;
    numberTimes = roundLessToPackage(fromCsv.length) / sizePackage;
    remain = csvData.length - roundLessToPackage(fromCsv.length);
    realNumberTimes = 0;
    if (remain > 0) {
        realNumberTimes = numberTimes + 1;
    } else {
        realNumberTimes = numberTimes;
    }

    db.any("INSERT INTO task_data(from_csv, id_task, put_date, all_number_times, count_address, amount_token) VALUES($1, $2, $3, $4, $5, $6)", [csvData, idTask,
        currentDate, realNumberTimes, 	csvData.length, sentTokens])
        .then(data => {
        console.log(data.id_task_data); //
    })
    .catch(error => {
        console.log('ERROR:', error); // print error;
    });
}

module.exports.getCsvFromDB = function (idTask) {
    console.log("Get data csv-file from DB ...");
    var result;
    db.any("select from_csv from task_data where id_task = $1", [idTask])
        .then(data => {
        //console.log(data); //
        result = data;
    })
    .catch(error => {
        console.log('ERROR:', error); // print error;
    });
    return result;
}

/*

db.any("INSERT INTO users(name, age) VALUES($1, $2)", ["vasya", 33])
    .then(data => {
        console.log(data); // print new user id;
    })
.catch(error => {
    console.log('ERROR:', error); // print error;
});
*/


/*
db.any("INSERT INTO users(name, age) VALUES($1, $2)", ["John", 21])
    .then(function (data) {
        console.log("DATA:", data.value);
    })
    .catch(error => {
    console.log("ERROR:", error);
    });
*/


/*
db.result("DELETE FROM users WHERE name = $1", ["John"])
    .then(result => {
    // rowCount = number of rows affected by the query
    console.log(result.rowCount); // print how many records were deleted;
    })
    .catch(error => {
    console.log('ERROR:', error);
});
*/

/*
db.any("select * from users where name = $1", ["vasya"])
    .then(function (data) {
        console.log("DATA:", data.value);
    })
    .catch(function (error) {
        console.log("ERROR:", error);
    });
*/


/*
db.result('DELETE FROM users WHERE name = $1', ["vasya"], r => r.rowCount)
.then(data => {
    console.log("DATA:", data.value);
    // data = number of rows that were deleted
});*/

function roundLessToPackage(num) {
    return Math.floor(num / sizePackage) * sizePackage;
}

function getAmountTokens(fromCsv) {
    var result = new BigNumber(0);
    for (var i = 0; i < fromCsv.length; i++) {
        result = result.plus(fromCsv[i][1]);
        console.log("result = " + result);
    }
    console.log("amount tokens = " + result);

    return result.toFixed(18);
}