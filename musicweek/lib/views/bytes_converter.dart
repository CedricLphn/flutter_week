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
        appBar: AppBar(title: Text("test")),
        body: Container(
          child: Column(children: <Widget>[
            Column(
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Octet - O',
                    'Kilooctet – KO',
                    'Mégaoctet – MO',
                    'Gigaoctet - GO',
                    ' Téraoctet – TO',
                    ' Pétaoctet – PO'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a search term'),
                )
              ],
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Octet - O',
                'Kilooctet – KO',
                'Mégaoctet – MO',
                'Gigaoctet - GO',
                ' Téraoctet – TO',
                ' Pétaoctet – PO'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ]),
        ));
  }
}
