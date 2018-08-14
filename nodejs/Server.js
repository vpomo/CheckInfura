var express = require('express');        // call express
var app = express();                 // define our app using express
var bodyParser = require('body-parser');
var port = process.env.PORT || 8080;        // set our port

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

module.exports.startHttpServer = function () {
// ROUTES FOR OUR API
// =============================================================================
    var router = express.Router();              // get an instance of the express Router

    router.route('/start')
    // get all the bears (accessed at GET http://localhost:8080/api/start)
        .get(function (req, res) {
            console.log(req);
            //http://127.0.0.1:8080/api/tokens?id=hghgjgj&name=Super
            res.json({message: 'Starting transfer ...'});
        });


    router.route('/tokens')

    // create a bear (accessed at POST http://localhost:8080/api/tokens)
        .post(function (req, res) {
            console.log(req);
        })

        // get all the bears (accessed at GET http://localhost:8080/api/tokens)
        .get(function (req, res) {
            console.log(req);
            //http://127.0.0.1:8080/api/tokens?id=hghgjgj&name=Super
            res.json({message: 'hooray! welcome to our api!', params_id: req.query.id, params_name: req.query.name});
        });

    router.route('/tokens/:id')

    // get the bear with that id (accessed at GET http://localhost:8080/api/tokens/:id)
        .get(function (req, res) {
            res.send('id: ' + req.params.id);
        });

    app.use('/api', router);

    app.listen(port);
    console.log('Magic happens on port ' + port);
}
