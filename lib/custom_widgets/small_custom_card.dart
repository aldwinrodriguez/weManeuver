import 'package:flutter/material.dart';

const TextStyle textSample = TextStyle(fontSize: 10.0);

class SmallCustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      child: Column(
        children: <Widget>[
          Text('Weather Icon', style: textSample),
          Text('city name', style: textSample),
          Text('from temp', style: textSample),
          Text('from desc', style: textSample),
          Text('from sub desc', style: textSample),
          Row(
            children: <Widget>[
              Text('high of', style: textSample),
              SizedBox(
                width: 10.0,
              ),
              Text('low of', style: textSample),
            ],
          ),
        ],
      ),
    );
  }
}
