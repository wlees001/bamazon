var inquirer = require('inquirer');
var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'bamazon',
});

function menuOptions() {
   inquirer.prompt([
    {
        type: 'list',
        name: 'option',
        message: 'Select an option: ',
        choices: ['Product List', 'Inventory', 'Add Inventory', 'Add New Product'],
        filter: function (val) {
            if (val === 'Product List') {
                return 'sale';
            } else if (val === 'Inventory') {
            return 'inventory low';
            } else if (val === 'Add Inventory') {
                return 'addInventory';
            } else if (val === 'New Product') {
                return 'newProduct';
            } else {
                console.log('Not happening bro');
               return bamazonStart();
            }
        }
   }
]).then(function(input) {
       if (input.option === 'sale') {
           showSale();
       } else if (input.option === 'Inventory') {
           showLowInventory();
       } else if (input.option === 'addInventory') {
           addInventory();
       } else if (input.option === 'newProduct') {
           newProduct();
       } else {
           return bamazonStart();
       }
    })
};

function showSale() {

           queryText = 'SELECT *FROM products';

           connection.query(queryText, function(err, data) {
              if (err) throw err;
              console.log('Current Inventory: ');
              console.log('__________________\n');

              var string = '';
              for (var i = 0; i< data.length; i++) {
                  string = '';
                  string += 'Item ID: ' + data[i].item_id;
                  string += 'Product Name: ' + data[i].product_name;
                  string += 'Department: ' + data[i].department_name;
                  string += 'Price: $' + data[i].price;
                  string += 'Quantity: ' + data[i].stock_quantity + '\n';

                  console.log(string);

              }
              connection.end();
           })
       };

function validateInteger(value) {
    var integer = Number.isInteger(parseFloat(value));
    var expression = Math.sign(value);

    if (interger === 1 && expression === 1) {
        return true;
    } else {
        return 'Enter a non-zero number'
    }
}

function addInventory() {
    inquirer.prompt([
        {
            type: 'input',
            name: 'item_id',
            message: 'Please enter the Item ID',
            validate: validateInteger,
            filter: Number
        },
        {
            type: 'input',
            name: 'quantity',
            message: 'How many would you like to add?',
            validate: validateInteger,
            filter: Number
        }
    ]).then(function(input) {
        var item= input.item_id;
        var addAmount = input.quantity;

        var queryText = 'SELECT * FROM products WHERE ?';
        connection.query(queryText, {item_id: item}, function(err, data) {
            if (err) throw (err);

            if (data.length === 0) {
                console.log('Error: Invalid Item ID')
                addInventory();
            } else {
                var productData = data[0];

            }

        })
    })
}

function newProduct() {
    inquirer.prompt([
        {
            type: 'input',
            name: 'product_name',
            message: 'Enter a Product Name'
        },
        {
            type: 'input',
            name: 'department_name',
            message: 'Which Department?'
        },
        {
            type: 'input',
            name: 'price',
            message: 'What is the price?'
        },
        {
            type: 'input',
            name: 'stock_quantity',
            message: 'How many items are in stock?',
            validate: validateInteger
        }
    ]).then(function(input) {
        console.log('Adding New Item...')

        var queryText = 'INSERT INTO products SET ?';
        connection.query(queryText, input, function(err, results, fields) {
            if (err) throw (err);
            console.log('New Product added!')
            connection.end();
        });
    })
}

function bamazonStart() {
    menuOptions();
}

bamazonStart();
