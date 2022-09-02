import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presonal_expence_tracker/Model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return
        //Mapping the transaction list into a column widget.
        Column(
            children: transactions.map((tx) {
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColorDark,
            boxShadow: [
              //top left shadow
              const BoxShadow(
                color: Colors.white70,
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
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title and date
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  DateFormat('dd-MMM-yyyy').format(tx.date),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //Amount
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    '\$${tx.amount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //Delete icon
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red.shade400,
                    size: 30,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }).toList());
  }
}
