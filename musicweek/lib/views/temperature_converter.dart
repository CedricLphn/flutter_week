import 'package:flutter/material.dart';

class TempApp extends StatefulWidget {
  @override
  _TempAppState createState() => _TempAppState();
}

class _TempAppState extends State<TempApp> {
  double input;
  double output;
  bool fOrC;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

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
            "Tape une valeur en ${fOrC == false ? "Fahrenheit" : "Celsius"}",
      ),
    );

    // APPBAR
    AppBar appBar = AppBar(
      title: Text("Convertir des temperatures"),
      leading: Icon(Icons.home),
      actions: [Icon(Icons.more_vert)],
      backgroundColor: Colors.grey[850],
    );

    // Container du mode switch les degree
    Container tempSwitch = Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Choisi Fahrenheit ou Celsius",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.orangeAccent[400],
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Switch(
          //   value: fOrC,
          //   onChanged: (e) {
          //     setState(() {
          //       fOrC = !fOrC;
          //     });
          //   }
          // )

          // Checkbox(
          // value: fOrC,
          // onChanged: (e) {
          //   setState(() {
          //     fOrC = !fOrC;
          //   });
          // },
          //)

          // Radio pour Switcher les degree
          Text("F"),
          Radio<bool>(
              value: false,
              groupValue: fOrC,
              onChanged: (v) {
                setState(() {
                  fOrC = v;
                });
              }),
          Text("C"),
          Radio<bool>(
              value: true,
              groupValue: fOrC,
              onChanged: (v) {
                setState(() {
                  fOrC = v;
                });
              }),
        ],
      ),
    );

    //Calcule de la temperature
    Container calcBtn = Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25.0),
          primary: Colors.orangeAccent[400], // background
          onPrimary: Colors.white, // foreground
        ),
        child: Text("Valider"),
        onPressed: () {
          setState(() {
            fOrC == false
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
          });

          // Alert pour savoir la temperature
          AlertDialog dialog = AlertDialog(
            content: fOrC == false
                ? Text("$input F : $output C")
                : Text("$input C : $output F"),
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
