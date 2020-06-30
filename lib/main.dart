import 'package:flutter/material.dart';
import 'package:personalexpensesapp/models/transaction.dart';
import 'package:personalexpensesapp/widgets/new_transaction.dart';
import 'package:personalexpensesapp/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense planner.",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  String amount;

  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(onSubmit: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransactionList(
              transactions: _userTransactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
