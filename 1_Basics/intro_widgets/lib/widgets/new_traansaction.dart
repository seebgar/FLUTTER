import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction({this.addTransactionHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final String txt = _titleController.text;
    final double val = double.tryParse(_amountController.text);

    if (txt.isEmpty || val == null || val <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransactionHandler(txt, val, _selectedDate);

    Navigator.of(context).pop(); // * close the model
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datePicked) {
      if (datePicked == null) {
        return;
      }

      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData,
            ),
            // * date picker
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No date chosen."
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          child: Text(
                            "Choose date.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _presentDatePicker)
                      : FlatButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Choose date.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Theme.of(context).primaryColor,
                        )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text(
                "Add",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
