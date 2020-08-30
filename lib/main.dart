import 'package:expenses_planner/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(amount: 45.67, id: 't1', title: 'Shoes', date: DateTime.now()),
    Transaction(amount: 12.34, id: 't2', title: 'Shirt', date: DateTime.now()),
    Transaction(amount: 23.45, id: 't3', title: 'Pants', date: DateTime.now()),
    Transaction(amount: 55.44, id: 't4', title: 'Hat', date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tx.title,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(tx.date.toIso8601String(),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey)),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
