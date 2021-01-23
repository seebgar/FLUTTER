import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_widgets/models/transaction.dart';
import 'package:intro_widgets/widgets/chart.dart';
import 'package:intro_widgets/widgets/new_traansaction.dart';
import 'package:intro_widgets/widgets/transaction_list.dart';

//
// ** MAKE BUTTONS, INPUTS, TEXT EXT, A GLOBAL CLASS SO CAN BE CONSISTENT EVERYQHERE
// ** For iOS style, is better to have a custom style defined by the developer
// ** use facebok design as guide
//

void main() {
  // * FORCE PORTRAIT MODE
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // * based on a single color and shades
        accentColor: Colors.green,
        errorColor: Colors.blueGrey,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                color: Colors.grey[850],
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 24,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

/// State full
/// * To easy convert widgets :: click the widget and press CMD + .
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recent {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final tx = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      transactions.add(tx);
    });
  }

  void _deleteTransaction(String _id) {
    setState(() {
      transactions.removeWhere((element) => element.id == _id);
    });
  }

  /// opens widget with animation
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: NewTransaction(
              addTransactionHandler: _addTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startAddNewTransaction(context),
              ),
            ],
          );

    final mediaQuery = MediaQuery.of(context);

    //final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final pageBody = SafeArea(
      child: Column(
        children: [
          Container(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top) *
                0.25,
            child: Chart(
              recents: _recent,
            ),
          ),
          Container(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top) *
                0.70,
            padding: EdgeInsets.only(left: 14, right: 14),
            child: TransactionList(
              transactions: transactions,
              deleteTx: _deleteTransaction,
            ),
          )
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            // * platform import dart:io
            floatingActionButton: !Platform.isIOS
                ? FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => startAddNewTransaction(context),
                    backgroundColor: Theme.of(context).accentColor,
                  )
                : Container(),
          );
  }
}
