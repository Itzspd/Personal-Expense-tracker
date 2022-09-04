import 'package:flutter/material.dart';
import 'package:presonal_expence_tracker/chart.dart';
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
    /*Transaction(
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
    ),*/
  ];

  List<Transaction> get _recenttransactions {
    return _usertransactions.where((recenttx) {
      return recenttx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addnewtransactions(
      String newtitle, double newamount, DateTime chosendate) {
    final newtransction = Transaction(
        Id: DateTime.now().toString(),
        title: newtitle,
        amount: newamount,
        date: chosendate);
    setState(() {
      _usertransactions.add(newtransction);
    });
  }

  void _deletetransaction(String id) {
    setState(() {
      _usertransactions.removeWhere((transaction) {
        return transaction.Id == id;
      });
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
            //Expense chart
            chart(_recenttransactions),
            const SizedBox(
              height: 50,
            ),
            //Text input for new transactions.
            TransactionList(_usertransactions, _deletetransaction),
          ],
        ),
      ),
    );
  }

  void _openbottomsheettoaddnewtransactions(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (BuildContext contex) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(
              _addnewtransactions,
            ),
          );
        });
  }
}
