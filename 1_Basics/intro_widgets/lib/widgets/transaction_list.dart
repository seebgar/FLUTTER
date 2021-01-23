import 'package:flutter/material.dart';
import 'package:intro_widgets/models/transaction.dart';
import 'package:intro_widgets/widgets/transaction-model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.3, // * dynamic size
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              // * builder for dynamic lists, loads only whats visible -- very long lists
              itemBuilder: (contextList, index) {
                // * build a widget an itemCount times
                return TransactionWidget(
                  trx: transactions[index],
                  deleteTx: deleteTx,
                );
              },
              itemCount: transactions.length, // * how many items to build
            ),
    );
  }
}
