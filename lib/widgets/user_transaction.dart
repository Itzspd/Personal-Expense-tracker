import 'package:flutter/material.dart';
import '../Model/transaction.dart';
import '../widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
    return Column(
      children: [
        NewTransaction(_addnewtransactions),
        const SizedBox(
          height: 20,
        ),
        //Transaction list
        TransactionList(_usertransactions),
      ],
    );
  }
}
