import 'package:flutter/material.dart';
import './Model/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Transactions list of type Transactions
  final List<Transaction> _usertransactions = [
    Transaction(
      Id: 't1',
      title: 'Books',
      amount: 19.01,
      date: DateTime.now(),
    ),
    Transaction(
      Id: 't2',
      title: 'Shoes',
      amount: 19.78,
      date: DateTime.now(),
    ),
  ];

  void _addnewtransactions(String newtitle, double newamount) {
    final newtransction = Transaction(
        Id: DateTime.now().toString(),
        title: newtitle,
        amount: newamount,
        date: DateTime.now());
    setState(() {
      _usertransactions.add(newtransction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'EXPENSE TRACKER',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () => _openbottomsheettoaddnewtransactions(context),
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Text input for new transactions.
            TransactionList(_usertransactions),
          ],
        ),
      ),
    );
  }

  void _openbottomsheettoaddnewtransactions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contex) {
          return NewTransaction(_addnewtransactions);
        });
  }
}
