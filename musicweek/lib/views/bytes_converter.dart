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
      body: SizedBox(
        height: 500,
        width: 500,
        child: Card(
          child: Column(
            children : [Row(
                children: <Widget>[
                  Text("To"),
                    Expanded(child:
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        he
                      )
                    )

                  ),
                  Text('GO')
                ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("hello"),
                    Text("Hello")
                  ])
            ],

          ),
        ),
      ),
    );
  }
}