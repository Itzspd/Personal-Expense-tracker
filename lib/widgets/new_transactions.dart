import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addnewtransaction;

  NewTransaction(this.addnewtransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleeditingcontroller = TextEditingController();
  final _amounteditingcontroller = TextEditingController();
  DateTime? _selectedDate;

  //String? textInput;
  void _submitdata() {
    if (_amounteditingcontroller.text.isEmpty) {
      return;
    }
    final _enteredtitle = _titleeditingcontroller.text;
    final _enteredamount = double.parse(_amounteditingcontroller.text);

    if (_enteredtitle.isEmpty || _enteredamount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addnewtransaction(
      _enteredtitle,
      _enteredamount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _opendatapicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
            controller: _titleeditingcontroller,
            onSubmitted: (_) => _submitdata(),
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            autocorrect: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            cursorHeight: 30,
            controller: _amounteditingcontroller,
            onSubmitted: (_) => _submitdata(),
            //onChanged: (val) => amountInput = val,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? 'No date chosen'
                    : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.green.shade500),
                ),
                onPressed: _opendatapicker,
                child: Text('Choose Date'),
              )
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green.shade600,
            ),
            onPressed: _submitdata,
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
