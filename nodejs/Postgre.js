//https://github.com/vitaly-t/pg-promise/wiki/Learn-by-Example#simple-select
//https://rage.mp/forums/topic/202-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D0%B5%D0%BC-%D1%81-postgresql/
var pgp = require("pg-promise")(/*options*/);
const config = {
    host: 'localhost',
    port: 5432,
    database: 'tokendb',
    user: 'token',
    password: 'rfhnjafy'
};
var db = pgp(config);

module.exports.putCsvFromFile = async function (csvData, idTask, sizePackage, idWallet) {
    var currentDate = new Date();
    var numberTimes;
    var remain;
    var realNumberTimes;
    var fromCsv;
    //console.log("csvData = " + csvData);
    var sentTokens = getAmountTokens(csvData);

    console.log("Put data from csv-file ...");
    console.log("Param[idWallet] = " + idWallet);

    fromCsv = csvData;
    numberTimes = roundLessToPackage(fromCsv.length, sizePackage) / sizePackage;
    remain = csvData.length - roundLessToPackage(fromCsv.length, sizePackage);
    realNumberTimes = Number(0);
    if (remain > 0) {
        realNumberTimes = Number(numberTimes) + 1;
    } else {
        realNumberTimes = Number(numberTimes);
    }
    await
    db.any("INSERT INTO task_data(from_csv, id_task, put_date, number_times, count_address, amount_token, active_task, real_number_times, remain_number, id_wordpress) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
        [JSON.stringify(csvData), idTask, currentDate, numberTimes, csvData.length, sentTokens, false, realNumberTimes, remain, idWallet])
        .then(data => {
        //console.log(data.id_task_data); //
    })
    .catch(error => {
        console.log('ERROR:', error); // print error;
    });
}

module.exports.getCsvFromDB = async function (idTask) {
    var result;
    console.log("Get data csv-file from DB ...");
    await
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

module.exports.setPendingStatusTask = async function (idTask, txHash) {
    var result;
    console.log("Update pending status ...");
    console.log("txHash = " + txHash);
    await
    db.any("UPDATE task_data set current_tx_hash = $2 where id_task = $1", [idTask, txHash])
        .then(data => {
        })
        .catch(error => {
                console.log('ERROR:', error); // print error;
        });
}

module.exports.setStatusTaskHistory = async function (idTask, status) {
    var result;
    console.log("Update status for task_history ...");
    console.log("status = " + status);
    await
    db.any("UPDATE task_history set status = $2 where id_task = $1", [idTask, status])
        .then(data => {
        })
        .catch(error => {
                console.log('ERROR:', error); // print error;
        });
}

module.exports.getPendingStatusTask = async function (idTask) {
    var result;
    console.log("Get pending status ...");
    await
    db.any("select current_tx_hash from task_data where id_task = $1", [idTask])
        .then(data => {
        //console.log(data); //
        result = data[0].current_tx_hash;
    })
    .catch(error => {
            console.log('ERROR:', error); // print error;
    });
    console.log("Result pending status = " + result);
    return result;
}

module.exports.putTransferHistory = function (amountTokens, numberTimes, idTask, thHash, idWordpress) {
    console.log("Put transfer_history ...");
    db.any("INSERT INTO transfer_history(sended_tokens, number_times, id_task, time_transfer, th_hash, id_wordpress) VALUES($1, $2, $3, $4, $5, $6)",
        [amountTokens, numberTimes, idTask, new Date(), thHash, idWordpress])
    .then(data => {
        console.log(data.id_task_data); //
    })
    .catch(error => {
            console.log('ERROR:', error); // print error;
    });
}

module.exports.getCountTimes  = async function(idTask) {
        var result;
        //console.log("Count task times ...");
        await
        db.any("SELECT COUNT(*) FROM transfer_history where id_task = $1", [idTask])
            .then(data => {
            result = data;
        })
            .catch(error => {
            console.log('ERROR:', error); // print error;
        });
        return result;
};

module.exports.getTask  = async function(idTask) {
    //console.log("Get task ...");
    var result;
    await
    db.any("SELECT from_csv, id_task, put_date, number_times, real_number_times, count_address, amount_token, active_task, remain_number FROM task_data where id_task = $1", [idTask])
        .then(data => {
        result = data;
    })
    .catch(error => {
            console.log('ERROR:', error); // print error;
    });
    return result;
};

module.exports.deleteTrasferHistory  = async function(idTask) {
    var result;
    console.log("Delete transfer history ...");
    await
    db.any("DELETE FROM transfer_history where id_task = $1", [idTask])
        .then(data => {
        result = data;
    })
    .catch(error => {
            console.log('ERROR:', error); // print error;
    });
    return result;
};

module.exports.setEnableTask = async function (idTask, status) {
    var result;
    console.log("Update status task ...");
    await
    db.any("UPDATE task_data set active_task = $2 where id_task = $1", [idTask, status])
        .then(data => {
    })
    .catch(error => {
            console.log('ERROR:', error); // print error;
    });
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

function roundLessToPackage(num, sizePackage) {
    return Math.floor(num / sizePackage) * sizePackage;;
}

function getAmountTokens(fromCsv) {
    var result = Number('0.0').toFixed(18);
    for (var i = 0; i < Number(fromCsv.length); i++) {
        result = sum(result,Number(fromCsv[i].value)).toFixed(18);
    }
    console.log("amount of tokens = " + result);

    return result;
}

function sum() {
    var result = 0;
    for (var i = 0, max = arguments.length; i< max; i++ ) {
        result += arguments[i]*10;
    }
    return result / 10;
}