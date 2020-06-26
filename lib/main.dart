import 'package:flutter/material.dart';
import 'package:personalexpensesapp/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense planner.",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Balls', amount: 100.69, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'New t-shirts', amount: 29.69, date: DateTime.now()),
    Transaction(
        id: 't4',
        title: 'Weekly Groceries',
        amount: 39.69,
        date: DateTime.now()),
    Transaction(
        id: 't5', title: 'Ethernet', amount: 9.69, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.green,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.red,
            child: Text('List of tx.'),
          ),
        ],
      ),
    );
  }
}
