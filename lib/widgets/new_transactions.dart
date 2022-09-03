import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addnewtransaction;
  final titleeditingcontroller = TextEditingController();
  final amounteditingcontroller = TextEditingController();

  NewTransaction(this.addnewtransaction);

  //String? textInput;
  //String? amountInput;

  void submitdata() {
    final enteredtitle = titleeditingcontroller.text;
    final enteredamount = double.parse(amounteditingcontroller.text);

    if (enteredtitle.isEmpty || enteredamount == 0) {
      return;
    }
    addnewtransaction(
      enteredtitle,
      enteredamount,
    );
  }

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
            keyboardType: TextInputType.text,
            controller: titleeditingcontroller,
            onSubmitted: (_) => submitdata(),
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            autocorrect: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            cursorHeight: 30,
            controller: amounteditingcontroller,
            onSubmitted: (_) => submitdata(),
            //onChanged: (val) => amountInput = val,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green.shade600,
            ),
            onPressed: submitdata,
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
