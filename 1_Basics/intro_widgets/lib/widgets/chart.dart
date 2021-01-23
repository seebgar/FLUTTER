import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_widgets/models/transaction.dart';
import 'package:intro_widgets/widgets/chart-data.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recents;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (var i in recents) {
        if (i.date.day == weekDay.day &&
            i.date.month == weekDay.month &&
            i.date.year == weekDay.year) {
          totalSum += i.amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactions.fold(
        0.0, (previousValue, element) => previousValue + element["amount"]);
  }

  Chart({this.recents});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactions.map((e) {
                return Flexible(
                  // * flexible flexfit.tight takes the remaining space
                  fit: FlexFit.tight,
                  child: ChartBar(
                      label: e["day"],
                      spendingAmount: e["amount"],
                      spendingTotal: maxSpending == 0.0
                          ? 0.0
                          : (e["amount"] as double) / maxSpending),
                );
              }).toList(),
            ),
          )),
    );
  }
}
