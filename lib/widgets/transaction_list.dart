import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('No transactions right now!'),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 200.0,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// return Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         margin: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 15.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).primaryColor,
//                                 width: 2)),
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               color: Theme.of(context).primaryColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.title,
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             style: TextStyle(color: Colors.grey),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
