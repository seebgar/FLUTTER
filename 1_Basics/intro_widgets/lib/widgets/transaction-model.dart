import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_widgets/models/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction trx;
  final Function deleteTx;

  TransactionWidget({this.trx, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Container(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$ ${trx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          trx.title,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          DateFormat('MMM dd yy').format(trx.date),
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            deleteTx(trx.id);
          },
        ),
      ),
    );
  }
}
