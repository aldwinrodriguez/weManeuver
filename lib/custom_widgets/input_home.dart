import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  final FocusNode node;
  final Function onEditingComplete;
  final String where;
  final Function onChanged;

  LocationInput(
      {this.node, this.onEditingComplete, this.where, this.onChanged});
//TODO figure out how Key key works
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onChanged: widget.onChanged,
        focusNode: widget.node,
        onEditingComplete: widget.onEditingComplete,
        textCapitalization: TextCapitalization.words,
        style: null,
        cursorColor: Colors.red,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: widget.where),
      ),
    );
  }
}
