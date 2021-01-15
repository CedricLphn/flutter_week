import 'package:flutter/material.dart';

class Binaire extends StatefulWidget {
  @override
  _Binaire createState() => _Binaire();
}

class _Binaire extends State<Binaire> {
  List<String> labels = [
    'Binaire - BIN',
    'Octal - OCT',
    'Décimal - DEC',
    'Hexadécimal - HEX',
  ];
  String value1;
  String value2;
  TextEditingController inController;
  TextEditingController outController;
  int inRes;
  int outRes;

  @override
  void initState() {
    super.initState();
    value1 = labels[2];
    value2 = labels[0];
    inController = TextEditingController(text: '');
    outController = TextEditingController(text: '');
    inRes = 0;
    outRes = 0;
  }

  //Call to change the outController value and update outRes
  void fromInToOut() {
    int resInDecimal = int.parse(toDecimal(inRes, value1));
    outController.text = resInDecimal != null
        ? toConvert(resInDecimal, value2).toString()
        : '';
    outRes = int.parse(outController.text);
  }

  //Call to change the inController value and update intRes
  void fromOutToIn() {
    int resInDecimal = int.parse(toDecimal(outRes, value2));
    inController.text =
    resInDecimal != null ? toConvert(resInDecimal, value1) : '';
    inRes = int.parse(inController.text);
  }

  //Convert every value into decimal
  String toDecimal(int value, String label) {
    if (value != null) {
      if (label == 'Décimal - DEC') {
        return value.toString();
      } else if (label == 'Binaire - BIN' ||
          label == 'Octal - OCT' ||
          label == 'Hexadécimal - HEX') {
        return value.toRadixString(value);
      }
    }
  }

  //Convert decimal values to all other unit values
  String toConvert(int value, String label) {
    if (value != null) {
      switch (label) {
        case 'Binaire - BIN':
          return value.toRadixString(2);
        case 'Octal - OCT':
          return value.toRadixString(8);
        case 'Décimal - DEC':
          return value.toString();
        case 'Hexadécimal - HEX':
          return (value.toRadixString(16)).toUpperCase();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Convertir des binaires"),
        ),
        body: Center(
            child: SizedBox(
              width: 500,
              height: 300,
              child: Card(
                color: Colors.white54,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Unit of measure to convert
                    DropdownButton<String>(
                      value: value1,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.brown),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (v) {
                        setState(() {
                          value1 = v;
                          fromOutToIn();
                        });
                      },
                      items: labels.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    SizedBox(
                      width: 200,
                      height: 60,
                      //Value to convert
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            inRes = int.parse(val);
                            fromInToOut();
                          });
                        },
                        controller: inController,
                        decoration: new InputDecoration(labelText: ""),
                      ),
                    ),

                    //Unit of measure to convert to
                    DropdownButton<String>(
                      value: value2,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.brown),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (v) {
                        setState(() {
                          value2 = v;
                          fromInToOut();
                        });
                      },
                      items: labels.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    //Value to convert to
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            outRes = int.parse(val);
                            fromOutToIn();
                          });
                        },
                        controller: outController,
                        decoration: new InputDecoration(labelText: "Resultat: "),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}