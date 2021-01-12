import 'package:flutter/material.dart';

class BytesConvert extends StatefulWidget {
  @override
  _BytesConvertState createState() => _BytesConvertState();
}

class _BytesConvertState extends State<BytesConvert> {
  String dropdownValue = 'Octet - O';

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
                          items: <String>[
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
                          }).toList(),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
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
                          value: dropdownValue,
                          style: TextStyle(color: Colors.deepPurple),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
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
                          }).toList(),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
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
