import 'package:flutter/material.dart';

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Budget Tracker'),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white), // Updated style
            ),

            SizedBox(height: 20),
            Text(
              'User Name',
              style: TextStyle(fontSize: 30, color: Colors.white), // Updated style
            ),
            SizedBox(height: 10),
            Text(
              'Total Expenses: \40370',
              style: TextStyle(fontSize: 30, color: Colors.white), // Updated style
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpenseScreen()),
                );
              },
              child: Text('Add/View Expenses'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  final List<Expense> dummyExpenses = [
    Expense(description: 'Expense 1', amount: -100),
    Expense(description: 'Expense 2', amount: 500),
    Expense(description: 'Expense 3', amount: 50000),
    // Add more dummy expenses here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Expenses') ,
      )),
      body: ListView.builder(
        itemCount: dummyExpenses.length,
        itemBuilder: (context, index) {
          Expense expense = dummyExpenses[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('${expense.description} : ${expense.amount}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Implement the logic to delete the expense
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddExpensePopup(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class Expense {
  String description;
  double amount;

  Expense({required this.description, required this.amount});
}

class AddExpensePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Entry'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Category'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Implement the logic to save the new expense
            Navigator.pop(context); // Close the popup
          },
          child: Text('Save'),
          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent), // Updated style
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the popup
          },
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent), // Updated style
        ),
      ],
      backgroundColor: Colors.white, // Updated background color
    );
  }
}
