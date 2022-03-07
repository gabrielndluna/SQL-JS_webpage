var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
const { request } = require('express');
var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/public'));

//Connect to MYSQL server
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Alighierisql12',
    database : 'join_us'
  });

//Set Homepage
app.get("/", function(req, res){
    //Find count of users in DB
    var q = 'SELECT COUNT(*) AS count FROM users';
    connection.query(q, function(error, results){
        if (error) throw error;
        var count = results[0].count;
        res.render('home', {data: count});
    })
});

app.post('/register', function(req, res){
    //Add user into DB
    var person = {
        email: req.body.email
    };
    var q = 'INSERT INTO users SET ?'
    connection.query(q, person, function(error, results){
        if (error) throw error;
        console.log(results);
        res.redirect('/');
    });
})

app.listen(8080, function(){
    console.log('Server running on 8080!');
});