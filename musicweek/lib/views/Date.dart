import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savoir mon âge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Connaître mon âge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result="";
  String dateDuJour="";
  String jour="", mois="", annee ="", dateUne="", dateDeux="";
  String dateSelect= "Aucune date sélectionnée";
  int mois1, annee1, jour1;
  DateFormat df = new DateFormat.yMd();
  DateFormat ddf = new DateFormat.yMMMMd('en_US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Combien de jours depuis la dernière fois"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Aujourd'hui nous sommes le :"),
            Text(dateDuJour = ddf.format(DateTime.now())),
            Text(""),
            // Text(dateSelect),
            // Text(result),
            RaisedButton(
              child: Text("Sélectionner les dates"),
              onPressed: (){f1();},
            ),
            Text(result),
            Text(dateUne),
            Text(dateDeux)
          ],
        ),
      ),

    );
  }

  Future f1() async {
    DateTime date2 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now(), helpText: 'Date de fin');
    DateTime date1 = await showDatePicker(context: context, initialDate: date2, firstDate: DateTime(1900), lastDate: DateTime.now(), helpText: 'Date de début');
    setState(() {
      // this.dateSelect = df.format(date1);
      jour1=int.parse(DateFormat("dd").format(date1));
      mois1=int.parse(DateFormat("MM").format(date1));
      annee1=int.parse(DateFormat("yy").format(date1));
      int jour2=int.parse(DateFormat("dd").format(date2));
      int mois2=int.parse(DateFormat("MM").format(date2));
      int annee2=int.parse(DateFormat("yy").format(date2));
      int day = finddays(mois2, annee2);


      if(jour2 - jour1 >= 0) {
        jour = (jour2 - jour1).toString();
      }
      else {
        jour = (jour2+day - jour1).toString();
        mois2 = mois2 - 1;
      }
      if(mois2 - mois1 >= 0) {
        mois = (mois2 - mois1).toString();
      }
      else {
        mois = (mois2+12 - mois1).toString();
        annee2 = annee2 - 1;
      }

      annee = (annee2 - annee1).toString();
      result = "Il y a " + jour + " jours, " + mois + " mois et " + annee + " années que vous ne vous êtes pas vus.";
      this.dateUne = "Date de début : " + df.format(date1);
      this.dateDeux = "Date de fin : " + df.format(date2);
    });
  }

  int finddays(int m2, int y2) {
    int day2;
    if(m2 == 1 || m2 == 3 || m2 == 7 || m2 == 8 || m2 == 10 || m2 == 12) { //mettre le bon nombre de jours selon les mois
      day2 = 31;
    } else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11) {
      day2 = 30;
    }
    else { //prendre en compte les annees bisextilles
      if(y2 % 4 == 0) {
        day2 = 29;
      }
      else {
        day2 =28;
      }
    }
    return day2;
  }
}
