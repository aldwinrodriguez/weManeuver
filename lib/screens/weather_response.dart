import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:we_maneuver/custom_widgets/custom_card.dart';
//import 'package:we_maneuver/utilities/network_helper.dart';

//import 'package:we_maneuver/custom_widgets/small_custom_card.dart';

import 'package:we_maneuver/custom_widgets/main_card.dart';
import 'package:we_maneuver/custom_widgets/from_card.dart';
import 'package:we_maneuver/custom_widgets/multiple_mini_card.dart';

import 'package:we_maneuver/utilities/constants.dart';

const TextStyle textSample = TextStyle(fontSize: 10.0);

class WeatherResponse extends StatefulWidget {
  final weatherData;

  WeatherResponse({this.weatherData});

  @override
  _WeatherResponseState createState() => _WeatherResponseState();
}

class _WeatherResponseState extends State<WeatherResponse> {
  _launchURL() async {
    const url =
        'https://www.youtube.com/watch?v=TYCBicKyVhs&list=PLUag27pXbdWgvLAPzKGlHsRkv-Fx5qcvi&index=4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//  }

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    var r = widget.weatherData;
    String sample = r['avgWeatherAndDesc'][0];
    print('this is $sample');
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: responsive.getBackground(sample),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 22,
                child: MainCard(
                  decoration: responsive.getShadow(colors[sample]),
                  icon: Image.asset("images/${r['avgWeatherAndDesc'][0]}.gif"),
                  mainDesc: Text(r['mainDesc']),
                  stat: Text('Mostly ${r['avgTemp']}\u00b0 if you go now'),
                ),
              ),
              Expanded(
                flex: 16,
                child: FromToCard(
                  decoration: responsive.getShadow(colors[sample]),
                  icon: Image.asset("images/${r['iconFrom']}.gif"),
                  where: Text(r['cityFrom'], style: textSample),
                  mainTemp: Text('${r['tempFrom']}\u00b0', style: textSample),
                  mainDesc: Text(r['mainDescFrom'], style: textSample),
                  subDesc: Text(r['descriptionFrom'], style: textSample),
                  highTemp:
                      Text('${r['maxTempFrom']}\u00b0', style: textSample),
                  lowTemp: Text('${r['minTempFrom']}\u00b0', style: textSample),
                ),
              ),
              Expanded(
                flex: 11,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, int index) {
                    return MultipleMiniCard(
                      decoration: responsive.getShadow(colors[sample]),
                      icon: Image.asset(
                          "images/${r['list'][index]['weather'][0]['icon']}.gif"),
                      where: Text(r['list'][index]['name'], style: textSample),
                      mainTemp: Text(
                          '${r['list'][index]['main']['temp'].round().toString()}\u00b0',
                          style: textSample),
                      mainDesc: Text(r['list'][index]['weather'][0]['main'],
                          style: textSample),
//                    highTemp: Text(
//                        '${r['list'][index]['main']['temp_max'].round().toString()}\u00b0',
//                        style: textSample),
//                    lowTemp: Text(
//                        '${r['list'][index]['main']['temp_min'].round().toString()}\u00b0',
//                        style: textSample),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 16,
                child: FromToCard(
                  decoration: responsive.getShadow(colors[sample]),
                  icon: Image.asset("images/${r['iconTo']}.gif"),
                  where: Text(r['cityTo'], style: textSample),
                  mainTemp: Text('${r['tempTo']}\u00b0', style: textSample),
                  mainDesc: Text(r['mainDescTo'], style: textSample),
                  subDesc: Text(r['descriptionTo'], style: textSample),
                  highTemp: Text('${r['maxTempTo']}\u00b0', style: textSample),
                  lowTemp: Text('${r['minTempTo']}\u00b0', style: textSample),
                ),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
//                  color: Color(0x96db1a00),
                  color: Colors.black,
                  onPressed: _launchURL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Drive now and Play some music on youtube ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.play_circle_filled,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
