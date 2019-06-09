import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

import 'package:we_maneuver/utilities/constants.dart';
import 'package:we_maneuver/screens/weather_response.dart';
//import 'package:we_maneuver/custom_widgets/input_home.dart';
import 'package:we_maneuver/custom_widgets/location_input_button.dart';

import 'package:we_maneuver/utilities/non_duplicated_cities_list.dart';
import 'package:we_maneuver/utilities/duplicated_cities_list.dart';

import 'package:we_maneuver/utilities/network_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();

  void callthis() async {
    NetworkHelper networkHelper =
        NetworkHelper('http://wedrive2019.com/elizabeth-paramus');
    var datas = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherResponse(
              weatherData: datas,
            ),
      ),
    );
  }

  TextEditingController controllerFrom = TextEditingController();
  TextEditingController controllerTo = TextEditingController();

  //  List<Map> duplicatedKeys = [];
  List nonDuplicatedKeys =
      nonDuplicatedCityKeys.notDuplicatedCities.keys.toList();

  String from = '';
  String to = '';
  int fromID;
  int toID;

//  TODO ID's are gonna get passed down to the next page

  static NonDuplicatedCityList nonDuplicatedCityKeys = NonDuplicatedCityList();
  static DuplicatedCityList duplicatedCityKeys = DuplicatedCityList();

  List locationContainer = [];
  List locationContainers = [];

  bool locationSwitch = true;

//  TODO add duplicated and non duplicated keys together

//  @override
//  void initState() {
//    super.initState();
//    for (int i = 0; i < duplicatedCityKeys.duplicatedCities.length; i++) {
//      duplicatedKeys.add(duplicatedCityKeys.duplicatedCities[i]);
//    }
//  }

  void addLocationContainer(val) {
    for (int i = 0; i < nonDuplicatedKeys.length; i++) {
      String element = nonDuplicatedKeys[i];
      if (element.indexOf(val) >= 0) {
        locationContainer.add(element);
      }
    }
//    for (int i = 0; i < duplicatedKeys.length; i++) {
//      Map element = duplicatedKeys[i];
////      print(element);
//      if (element['name'].indexOf(val) >= 0) {
//        locationContainer.add(element);
//      }
//    }
  }

  Function changeTarget(val) {
    if (locationSwitch) {
      from = val;
      fromID = nonDuplicatedCityKeys.notDuplicatedCities[from];
      controllerFrom.text = from;
    } else if (!locationSwitch) {
      to = val;
      toID = nonDuplicatedCityKeys.notDuplicatedCities[to];
      controllerTo.text = to;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorHome,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 15, 32, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Center(
                    child: Text(
                      'We \nManeuver',
                      style: TextStyle(fontSize: 50.0, height: 0.6),
                    ),
                    // TODO make the logo
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextField(
                    controller: controllerFrom,
                    onTap: () {
                      locationSwitch = true;
                      locationContainer = [];
                      setState(() {});
                    },
                    onChanged: (val) {
                      locationContainer = [];
                      if (val.length >= 3) {
                        addLocationContainer(val);
                      }
                      setState(() {});
                    },
                    focusNode: nodeOne,
                    onSubmitted: (val) {
                      FocusScope.of(context).requestFocus(nodeTwo);
                    },
                    textCapitalization: TextCapitalization.words,
                    style: null,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'From'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextField(
                    controller: controllerTo,
                    onTap: () {
                      locationSwitch = false;
                      locationContainer = [];
                      setState(() {});
                    },
                    onChanged: (val) {
                      locationContainer = [];
                      if (val.length >= 3) {
                        addLocationContainer(val);
                      }
                      setState(() {});
                    },
                    focusNode: nodeTwo,
                    textCapitalization: TextCapitalization.words,
                    style: null,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'To'),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                    itemCount: locationContainer.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LocationInputButton(
                        where: locationContainer[index],
//                            TODO try throwing an exception
                        onPressed: () {
                          changeTarget(locationContainer[index]);
                          locationContainer = [];
                          setState(() {});
                        },
                      );
                    }),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(from),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              callthis();
                            },
                            child: Text('To'),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text(to)),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO implement ID request in weDrive2019.com
