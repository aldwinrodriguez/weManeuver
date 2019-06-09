import 'package:flutter/material.dart';

Color backgroundColorHome = Colors.grey;

Map colors = {
  '01d': [Color(0xE1ff8400), Color(0x64ff9f64)],
  '01n': [Color(0xE1ff8400), Color(0x64ff9f64)],
  '02d': [Color(0xE1ff8400), Color(0x64ff9f64)],
  '02n': [Color(0xE1ff8400), Color(0x64ff9f64)],
  '09d': [Color(0xfff0e2fc), Color(0xC8e2fafc)],
  '09n': [Color(0xfff0e2fc), Color(0xC8e2fafc)],
  '10d': [Color(0xfff0e2fc), Color(0xC8e2fafc)],
  '10n': [Color(0xfff0e2fc), Color(0xC8e2fafc)],
  '04d': [Color(0xffd079fc), Color(0x9679d0fc)],
  '04n': [Color(0xffd079fc), Color(0x9679d0fc)],
  '03d': [Color(0xffd079fc), Color(0x9679d0fc)],
  '03n': [Color(0xffd079fc), Color(0x9679d0fc)],
  '11d': [Color(0xfff3f1ff), Color(0x969c90d4)],
  '11n': [Color(0xfff3f1ff), Color(0x969c90d4)],
  '13d': [Color(0xfff3f1ff), Color(0xffb5ade8)],
  '13n': [Color(0xfff3f1ff), Color(0xffb5ade8)],
  '50d': [Color(0xfff3f1ff), Color(0xffb5ade8)],
  '50n': [Color(0xfff3f1ff), Color(0xffb5ade8)],
};
//List<Color> sunny = [Color(0xE1ff8400), Color(0x64ff9f64)];
//List<Color> rain = [Color(0xfff0e2fc), Color(0xC8e2fafc)];
//List<Color> drizzle = [Color(0xfff0e2fc), Color(0xC8e2fafc)];
//List<Color> cloud = [Color(0xffd079fc), Color(0x9679d0fc)];
//List<Color> thunder = [Color(0xfff3f1ff), Color(0x969c90d4)];
//List<Color> snow = [Color(0xfff3f1ff), Color(0xffb5ade8)];

class Responsive {
  getBackground(val) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/background/$val.jpg'), fit: BoxFit.cover),
    );
  }

  getShadow(val) {
    return BoxDecoration(
      border: Border.all(width: 0.05),
      gradient: LinearGradient(
          begin: Alignment.topRight, end: Alignment.bottomLeft, colors: val),
      borderRadius: BorderRadius.circular(6.0),
    );
  }
}
