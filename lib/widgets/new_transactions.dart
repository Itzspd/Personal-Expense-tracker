import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addnewtransaction;
  final titleeditingcontroller = TextEditingController();
  final amounteditingcontroller = TextEditingController();

  NewTransaction(this.addnewtransaction);

  //String? textInput;
  //String? amountInput;s

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            autocorrect: true,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            cursorHeight: 30,

            controller: titleeditingcontroller,
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            autocorrect: true,

            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            cursorHeight: 30,
            controller: amounteditingcontroller,
            //onChanged: (val) => amountInput = val,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green.shade600,
            ),
            onPressed: () {
              addnewtransaction(
                titleeditingcontroller.text,
                double.parse(amounteditingcontroller.text),
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
