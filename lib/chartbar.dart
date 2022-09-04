import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double remainingAmount;

  CharBar(
    this.label,
    this.spendingAmount,
    this.remainingAmount,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Weekday Initial and Bars
        Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                label,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            //Bars
            SizedBox(
                height: 12,
                width: 220,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: remainingAmount,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        //Amount

        //Todo, add a condition to add K if in thousands, M in millions and B in billions
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            '\$${spendingAmount.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
