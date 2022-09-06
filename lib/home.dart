import 'dart:io'; // Used to check which os platform i am on.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './chart.dart';
import './Model/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

//MIXIN
//widgetBindingObserver is used to check for the appsate; paused, active,resume etc.
class _HomeState extends State<Home> with WidgetsBindingObserver {
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

  PreferredSizeWidget _buildadaptiveappbar() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'EXPENSE TRACKER',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _openbottomsheettoaddnewtransactions(context),
                  child: const Icon(
                    CupertinoIcons.add,
                  ),
                )
              ],
            ),
          )
        : AppBar(
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
          ) as PreferredSizeWidget;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

//function to check the app_state.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);

    super.didChangeAppLifecycleState(state);
  }

//a dispose function to clear the appcycle listener.
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    final appbar = _buildadaptiveappbar();

    final pagebody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Expense chart and chart bars.
            SizedBox(
              //Deducting the height chart, the appbar height and the status bar height.
              height: (mediaquery.size.height -
                      appbar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.4,
              child: chart(_recenttransactions),
            ),
            SizedBox(
              height: (mediaquery.size.height -
                      appbar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.05,
            ),
            //Text input for new transactions and transaction list.
            SizedBox(
              //Deducting the height of the list container, the appbar height and the status bar height.
              height: (mediaquery.size.height -
                      appbar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.55,
              child: TransactionList(_usertransactions, _deletetransaction),
            ),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pagebody,
          )
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: _buildadaptiveappbar() as PreferredSizeWidget,
            body: pagebody);
  }

  void _openbottomsheettoaddnewtransactions(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
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
