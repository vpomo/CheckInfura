//https://github.com/vitaly-t/pg-promise/wiki/Learn-by-Example#simple-select
//https://rage.mp/forums/topic/202-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D0%B5%D0%BC-%D1%81-postgresql/
var pgp = require("pg-promise")(/*options*/);                 
var db = pgp("postgres://token:**@127.0.0.1:5439/tokendb");

db.any("INSERT INTO users(name, age) VALUES($1, $2)", ["vasya", 33])
    .then(data => {
        console.log(data); // print new user id;
    })
.catch(error => {
    console.log('ERROR:', error); // print error;
});

/*
db.any("INSERT INTO users(name, age) VALUES($1, $2)", ["John", 21])
    .then(function (data) {
        console.log("DATA:", data.value);
    })
    .catch(error => {
    console.log("ERROR:", error);
    });
*/

db.any("select * from users where name = $1", ["vasya"])
    .then(function (data) {
        console.log("DATA:", data.value);
    })
    .catch(function (error) {
        console.log("ERROR:", error);
    });

db.result("DELETE FROM users WHERE name = $1", ["John"])
    .then(result => {
    // rowCount = number of rows affected by the query
    console.log(result.rowCount); // print how many records were deleted;
})
.catch(error => {
    console.log('ERROR:', error);
});


/*
db.result('DELETE FROM users WHERE name = $1', ["vasya"], r => r.rowCount)
.then(data => {
    console.log("DATA:", data.value);
    // data = number of rows that were deleted
});*/
