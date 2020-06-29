import 'package:flutter/material.dart';
import 'package:personalexpensesapp/models/transaction.dart';
import 'package:personalexpensesapp/widgets/new_transaction.dart';
import 'package:personalexpensesapp/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(onSubmit: _addNewTransaction),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
