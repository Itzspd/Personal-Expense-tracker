import 'package:flutter/material.dart';
import '/widgets/user_transaction.dart';
import './Model/transaction.dart';

class Home extends StatelessWidget {
  //Transactions list of type Transactions
  final List<Transaction> transactions = [];

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
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //Expense tracker chart.
              Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                child: const Text(
                  'Expense Chart',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Text input for new transactions.
              UserTransactions()
            ],
          ),
        ),
      ),
    );
  }
}
