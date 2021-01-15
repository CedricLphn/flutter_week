import 'dart:math';

import 'package:flutter/material.dart';

class Distance extends StatefulWidget {
  @override
  _DistanceState createState() => _DistanceState();

  List<DropdownMenuItem<String>> listConverter = <String>[
    'Kilomètre – km',
    'Mètre – m',
    'Décimètre – dm',
    'Centimètre – cm',
    'Millimètre – m',
    'Nanomètre – nm',
    'Yard – yd',
    'Pied – ft',
    'Pouce – in'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class _DistanceState extends State<Distance> {
  String dropdownValue2 = 'Mètre – m';
  String dropdownValue = 'Kilomètre – km';

  double value1 = 0;
  double value2 = 0;

  List<String> list  = [
    'Kilomètre – km',
    'Mètre – m',
    'Décimètre – dm',
    'Centimètre – cm',
    'Millimètre – m',
    'Nanomètre – nm',
    'Yard – yd',
    'Pied – ft',
    'Pouce – in'
  ];

  var _controllerValueFormField = TextEditingController();
  var _controllerValue2FormField = TextEditingController();

  double convert(double number, String fromIndex, String toIndex) {

    Map<String, double> reference = <String, double>{
      'Kilomètre – km': 0.01,
      'Mètre – m' : 1,
      'Décimètre – dm' : 10,
      'Centimètre – cm' : 100,
      'Millimètre – m' : 1000,
      'Nanomètre – nm' : 1000000000,
      'Yard – yd' : 1.09361,
      'Pied – ft' : 3.28,
      'Pouce – in' : 39.3701
    };

    double factor1 = reference[fromIndex];
    double factor2 = reference[toIndex];

    return factor2 * number / factor1;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Distance")
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 500,
          child: Card(
            color: Colors.white54,
            elevation: 10,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  height: 50,
                  child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: DropdownButtonFormField<String>(
                                  value: dropdownValue,
                                  style: TextStyle(color: Colors.brown),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: Distance().listConverter)),
                          Flexible(
                            child: TextFormField(
                              onChanged: (event) {
                                if (event != "") {
                                  setState(() {
                                    value2 = double.parse(event);
                                    _controllerValue2FormField.text = convert(
                                        double.parse(event),
                                        dropdownValue,
                                        dropdownValue2
                                    ).toString();
                                  });
                                }
                              },
                              controller: _controllerValueFormField,
                              decoration: const InputDecoration(
                                labelText: 'Value 1',
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  height: 50,
                  color: Colors.white,
                  child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: DropdownButtonFormField<String>(
                              value: dropdownValue2,
                              style: TextStyle(color: Colors.brown),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue2 = newValue;
                                });
                              },
                              items: Distance().listConverter,
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              onChanged: (event) {
                                setState(() {
                                  value1 = double.parse(event);
                                  _controllerValueFormField.text = convert(
                                      double.parse(event),
                                      dropdownValue2,
                                      dropdownValue
                                  ).toString();
                                });
                              },
                              controller: _controllerValue2FormField,
                              decoration: const InputDecoration(
                                labelText: 'Value 2',
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

