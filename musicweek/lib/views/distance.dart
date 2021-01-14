import 'dart:math';
import 'package:flutter/material.dart';

class Distance extends StatefulWidget {
  @override
  _DistanceState createState() => _DistanceState();

  List<DropdownMenuItem<String>> listConverter = <String>[
    'Kilomètre - km',
    'Mètre - m',
    'Décimètre - dm',
    'Centimètre - cm',
    'Millimètre - mm',
    'Nanomètre - nm',
    'Yard - yd',
    'Pied - ft',
    'Pouce - in'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class _DistanceState extends State<Distance> {
  String dropdownValue2 = null;
  String dropdownValue = null;

  double value1 = 0;
  double value2 = 0;

  List<String> list = <String>[
    'Kilomètre - km',
    'Mètre - m',
    'Décimètre - dm',
    'Centimètre - cm',
    'Millimètre - mm',
    'Nanomètre - nm',
    'Yard - yd',
    'Pied - ft',
    'Pouce - in'
  ];

  var _controllerValue2FormField = TextEditingController();

  double convert(double number, int fromIndex, int toIndex, bool division) {
    int numberReference = 1024;

    return number / pow(numberReference, (toIndex + 1 - fromIndex + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Converter")),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Card(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
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
                              value: dropdownValue,
                              style: TextStyle(color: Colors.deepPurple),
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
                                        list.indexOf(dropdownValue),
                                        list.indexOf(dropdownValue2),
                                        false)
                                    .toString();
                              });
                            }
                          },
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
                          style: TextStyle(color: Colors.deepPurple),
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
