import 'package:flutter/material.dart';

const TextStyle textSample = TextStyle(fontSize: 10.0);

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text('weather icon', style: textSample),
          ),
          Expanded(
            child: Text('City name', style: textSample),
          ),
          Expanded(
            child: Text('From temp', style: textSample),
          ),
          Expanded(
            child: Text('from desc', style: textSample),
          ),
          Expanded(
            child: Text('from sub desc', style: textSample),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text('high', style: textSample),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('low', style: textSample),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
