import 'package:flutter/material.dart';

class MultipleMiniCard extends StatelessWidget {
  final icon, where, mainTemp, mainDesc, highTemp, lowTemp, decoration;

  MultipleMiniCard(
      {this.icon,
      this.where,
      this.mainTemp,
      this.mainDesc,
      this.highTemp,
      this.lowTemp,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      width: 80.0,
//      color: Colors.green,
      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
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
          Row(
            children: <Widget>[
              Expanded(child: Center(child: highTemp)),
              Expanded(child: Center(child: lowTemp)),
            ],
          ),
        ],
      ),
    );
  }
}
