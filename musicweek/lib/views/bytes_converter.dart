import 'dart:math';

import 'package:flutter/material.dart';

class BytesConvert extends StatefulWidget {
  @override
  _BytesConvertState createState() => _BytesConvertState();

  List<DropdownMenuItem<String>> listConverter = <String>[
    'Octet - O',
    'Kilooctet - KO',
    'Mégaoctet - MO',
    'Gigaoctet - GO',
    'Téraoctet - TO',
    'Pétaoctet - PO'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class _BytesConvertState extends State<BytesConvert> {
  String dropdownValue2 = 'Octet - O';
  String dropdownValue = 'Kilooctet - KO';

  double value1 = 0;
  double value2 = 0;

  List<String> list = <String>[
    'Octet - O',
    'Kilooctet - KO',
    'Mégaoctet - MO',
    'Gigaoctet - GO',
    'Téraoctet - TO',
    'Pétaoctet - PO'
  ];

  var _controllerValueFormField = TextEditingController();
  var _controllerValue2FormField = TextEditingController();

  double convert(double number, int fromIndex, int toIndex) {
    int numberReference = 1000;
    print("from $fromIndex");
    print("to $toIndex");

    return number / pow(numberReference, (toIndex - fromIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter"),
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.grey[850],
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
                              items: BytesConvert().listConverter)),
                      Flexible(
                        child: TextFormField(
                          onChanged: (event) {
                            if (event != "") {
                              setState(() {
                                value2 = double.parse(event);
                                _controllerValue2FormField.text = convert(
                                    double.parse(event),
                                    list.indexOf(dropdownValue),
                                    list.indexOf(dropdownValue2)
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
                          items: BytesConvert().listConverter,
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          onChanged: (event) {
                            setState(() {
                              value1 = double.parse(event);
                              _controllerValueFormField.text = convert(
                                  double.parse(event),
                                  list.indexOf(dropdownValue2),
                                  list.indexOf(dropdownValue)
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
