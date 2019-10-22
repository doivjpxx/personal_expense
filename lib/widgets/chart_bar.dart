import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spedingAmount;
  final double spedingPercentageOfTotal;

  ChartBar({this.label, this.spedingAmount, this.spedingPercentageOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: <Widget>[
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spedingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              width: 10.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spedingPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(height: constraint.maxHeight * 0.15, child: Text(label))
          ],
        );
      },
    );
  }
}
