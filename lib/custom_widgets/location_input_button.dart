import 'package:flutter/material.dart';

class LocationInputButton extends StatelessWidget {
  final where;
  final String coord;
  final Function onPressed;

  LocationInputButton({this.where, this.coord, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Container(
            child: Text(where),
          ),
          Container(
            child: (coord == null) ? null : Text(coord),
          ),
        ],
      ),
    );
  }
}
