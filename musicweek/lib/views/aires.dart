import 'dart:math';

import 'package:flutter/material.dart';

class Aires extends StatefulWidget {
  @override
  _AiresState createState() => _AiresState();

  List<DropdownMenuItem<String>> listConverter = <String>[
    'Kilomètre carré',
    'Mètre carré',
    'Centimètre carré',
    'Hectare',
    'Acre'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class _AiresState extends State<Aires> {
  String dropdownValue2 = 'Kilomètre carré';
  String dropdownValue = 'Mètre carré';

  double value1 = 0;
  double value2 = 0;

  List<String> list  = [
    "Kilomètre carré",
    "Mètre carré",
    "Centimètre carré",
    "Hectare",
    "Acre"
  ];

  var _controllerValueFormField = TextEditingController();
  var _controllerValue2FormField = TextEditingController();

  double convert(double number, String fromIndex, String toIndex) {

    Map<String, double> reference = <String, double>{
      "Kilomètre carré" : 0.000001,
      "Mètre carré" : 1,
      "Centimètre carré" : 10000.0,
      "Hectare" : 0.0001,
      "Acre": 0.0002471054
    };

    double factor1 = reference[fromIndex];
    double factor2 = reference[toIndex];

    return factor2 * number / factor1;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter"),
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.brown,
      ),
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
                                  items: Aires().listConverter)),
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
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue2 = newValue;
                                });
                              },
                              items: Aires().listConverter,
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

