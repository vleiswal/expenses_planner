import 'package:expenses_planner/models/transaction.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(amount: 45.67, id: 't1', title: 'Shoes', date: DateTime.now()),
    Transaction(amount: 12.34, id: 't2', title: 'Shirt', date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final nxTx = Transaction(
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: txTitle,
    );
    setState(() {
      _userTransactions.add(nxTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
