import 'package:flutter/material.dart';

Color backgroundColorHome = Colors.grey;

Decoration shadow = BoxDecoration(
  color: Colors.blue,
//            border: Border.all(color: Colors.black),
  boxShadow: [
    BoxShadow(color: Colors.red, offset: Offset(0.0, 0.0), blurRadius: 2.0),
    BoxShadow(color: Colors.red, offset: Offset(0.0, 0.0), blurRadius: 2.0)
  ],
  borderRadius: BorderRadius.circular(6.0),
);
