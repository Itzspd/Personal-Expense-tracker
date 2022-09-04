import 'package:flutter/material.dart';
import './Model/transaction.dart';
import './chartbar.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  final List<Transaction> recenttransactions;

  chart(this.recenttransactions);
  List<Map<String, Object>> get grouptransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalsumofamount = 0.0;

      for (var i = 0; i < recenttransactions.length; i++) {
        if (recenttransactions[i].date.day == weekday.day &&
            recenttransactions[i].date.month == weekday.month &&
            recenttransactions[i].date.year == weekday.year) {
          totalsumofamount += recenttransactions[i].amount;
        }
      }
      //print(DateFormat.E().format(weekday));
      //print(totalsumofamount);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsumofamount,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return grouptransactionValues.fold(0.0, (previousValue, item) {
      return previousValue + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    //  print(grouptransactionValues);
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorDark,
        boxShadow: [
          //top left shadow
          const BoxShadow(
            color: Colors.white24,
            offset: Offset(-3, -3),
            blurRadius: 5,
            spreadRadius: 0.5,
          ),
          //bottom right shadow
          BoxShadow(
            color: Colors.lightBlue.shade900,
            offset: const Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: grouptransactionValues.map((bars) {
          return CharBar(
            bars['day'].toString(),
            bars['amount'] as double,
            totalspending == 0.0
                ? 0.0
                : (bars['amount'] as double) / totalspending,
          );
        }).toList(),
      ),
    );
  }
}
