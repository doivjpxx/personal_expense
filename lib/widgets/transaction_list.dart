import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions right now!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.7,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              },
            )
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ),
                  )
                  .toList()),
    );
  }
}
