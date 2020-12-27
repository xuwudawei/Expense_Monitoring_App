import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTx;
  NewTransactions(this.addNewTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = new TextEditingController();

  final amountController = new TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }
    var title = titleController.text;
    var amount = double.parse(amountController.text);
    widget.addNewTx(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) => submitData(),
              ),
              RaisedButton(
                elevation: 0,
                color: Colors.white,
                child: Text(
                  'Add Transaction',
                ),
                textColor: Theme.of(context).primaryColor,
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
