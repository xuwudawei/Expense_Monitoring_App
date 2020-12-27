import 'package:expense_monitoring/src/models/transactionsModel.dart';
import 'package:expense_monitoring/src/widgets/HomePageWidgets/newTransactions.dart';
import 'package:expense_monitoring/src/widgets/HomePageWidgets/transactionsList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionsModel> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    final newTx = TransactionsModel(
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: title,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _popNewTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransactions(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _popNewTransactionForm(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                width: double.infinity,
                child: Card(
                  child: Text(
                    'Chart',
                  ),
                ),
              ),
              TransactionsList(_userTransactions)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _popNewTransactionForm(context),
        ),
      ),
    );
  }
}
