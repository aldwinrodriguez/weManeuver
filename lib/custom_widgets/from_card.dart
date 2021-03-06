import 'package:flutter/material.dart';

class FromToCard extends StatelessWidget {
  final icon, where, mainTemp, mainDesc, subDesc, highTemp, lowTemp, decoration;

  FromToCard(
      {this.icon,
      this.where,
      this.mainTemp,
      this.mainDesc,
      this.subDesc,
      this.highTemp,
      this.lowTemp,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 125.0, right: 125.0, top: 6.0, bottom: 6.0),
      child: Container(
        decoration: decoration,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: icon,
            ),
            Expanded(
              child: where,
            ),
            Expanded(
              child: mainTemp,
            ),
            Expanded(
              child: mainDesc,
            ),
            Expanded(
              child: subDesc,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: highTemp,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: lowTemp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
