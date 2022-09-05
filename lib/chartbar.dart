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
    return LayoutBuilder(builder: (ctx, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Weekday Initial and Bars
          Row(
            children: [
              FittedBox(
                child: SizedBox(
                  width: constraint.maxWidth * 0.2,
                  child: Text(
                    label,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              ),

              //Bars
              SizedBox(
                  height: constraint.maxHeight * 0.3,
                  width: constraint.maxWidth * 0.5,
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
            child: Container(
              width: constraint.maxWidth * 0.25,
              child: Text(
                '\$${spendingAmount.toStringAsFixed(2)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
