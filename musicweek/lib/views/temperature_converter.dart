import 'package:flutter/material.dart';

class TempApp extends StatefulWidget {
  @override
  _TempAppState createState() => _TempAppState();
}

class _TempAppState extends State<TempApp> {
  double input;
  double output;
  String fOrC;
  double celsius;
  double kelvin;
  double far;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = "F";
  }

  List<String> list = [
    "F",
    "C",
    "K"
  ];

  @override
  Widget build(BuildContext context) {
    //Instruction inputField
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText:
            "Tape une valeur en ${fOrC == "F" ? "Fahrenheit" : (fOrC == "C") ? "Celsius" : "Kelvin"}",
      ),
    );

    // APPBAR
    AppBar appBar = AppBar(
      title: Text("Convertir des temperatures"),
      //   leading: Icon(Icons.home),
      actions: [Icon(Icons.more_vert)],
      backgroundColor: Colors.brown,
    );

    // Container du mode switch les degree
    Container tempSwitch = Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              "F pour Fahrenheit C pour Celsius K pour Kelvin: ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Dropdown pour Switcher les degree
          DropdownButton<String>(
            value: fOrC,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.brown),
            underline: Container(
              height: 2,
            ),
            onChanged: (v) {
              setState(() {
                fOrC = v;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );

    //Calcule de la temperature
    Container calcBtn = Container(
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(25.0),
            primary: Colors.brown, // background
            onPrimary: Colors.white54,
            textStyle: TextStyle(fontWeight: FontWeight.bold) // foreground
            ),
        child: Text("Valider"),
        onPressed: () {
          setState(() {
            celsius = (fOrC == "K") ? input - 273.15 : (input * 9 / 5) + 32;
            far =  (fOrC == "K") ? (input - 273.15) * 9/5 + 32: (input - 32) * (5 / 9);
            kelvin = fOrC == "F" ? (input - 32) * 5/9 + 273.15 : input + 273.15;

          });

          // Alert pour savoir la temperature
          AlertDialog dialog = AlertDialog(
            content: fOrC == "F"
                ? Text("$input F : $far C : K : $kelvin")
                : fOrC == "C" ? Text("$input C : $far F : K : $kelvin") :
            fOrC == "K" ? Text("$input K : $celsius C : F : $far") : ""
            ,
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            },
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            inputField,
            tempSwitch,
            calcBtn,
          ],
        ),
      ),
    );
  }
}
