import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Age extends StatefulWidget {
  Age({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  String result="";
  String dateDuJour="";
  String info ="";
  String delai ="";
  String dateSelect = "Aucune date sélectionnée";
  //String timeSelect = "Aucune heure sélectionnée";
  int age, mois, annee, jour, heure, jourD, moisD, heureD, moisD1, jourD1;
  DateFormat df = new DateFormat.yMd();
  DateFormat dd = new DateFormat.d();
  DateFormat ddf = new DateFormat.yMMMMd('en_US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[850],
      appBar: new AppBar(
        title: Text("Trouver mon âge"),
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aujourd'hui nous sommes le :",
              style: TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
            ),
            Text(dateDuJour = ddf.format(DateTime.now()),
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),),
            Text(""),
            Text("Votre date de naissance est : ", style: TextStyle(
                fontSize: 12.0,
                color: Colors.white54,
            ),),
            Text(""),
            Container(
            //  width: 100,
             // height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.brown, Colors.grey]), borderRadius: new BorderRadius.circular(18.0)),
              padding: EdgeInsets.all(9),
              child: Text("${dateSelect}", style: TextStyle(color: Colors.white)),
            ),
            Text(""),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)
              ),
              child: Text("Sélectionner votre date de naissance"),
              textColor: Colors.white,
              color: Colors.brown.withOpacity(0.6),

              onPressed: (){
                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()
                ).then((value) => {
                  setState((){
                    this.dateSelect = df.format(value);
                    annee = DateTime.now().year - value.year;
                    jour = DateTime.now().difference(value).inDays;
                    heure = DateTime.now().difference(value).inHours;
                    moisD = value.month - DateTime.now().month;
                    mois = 12 * annee;
                    if(DateTime.now().day <= value.day) {
                      jourD = value.day - DateTime.now().day;
                    } else {
                      jourD = DateTime.now().day - value.day;
                    }
                    if(DateTime.now().month <= value.month) {
                      moisD = value.month - DateTime.now().month;
                    } else {
                      moisD = DateTime.now().month - value.month;
                    }

                    if(value.year % 4 == 0 && value.year % 100 != 0) {
                      if (DateTime.now().day < value.day) {
                        jourD1 = 366 - (value.day - DateTime.now().day);
                      } else {
                        jourD1 = 366 - (DateTime.now().day - value.day);
                      }
                    }
                    else {
                      if (DateTime.now().day < value.day) {
                        jourD1 = 365 - (value.day - DateTime.now().day);
                      } else {
                        jourD1 = 365 - (DateTime.now().day - value.day);
                      }

                    }

                    if( DateTime.now().month < value.month) { //anniversaire pas encore passé
                      mois = mois - (DateTime.now().month - value.month);
                      annee = annee - 1;
                      result = "Vous avez : " + annee.toString() + " ans !";
                      delai ="Votre anniversaire est dans " + moisD.toString() + " mois et " + jourD.toString() + " jours !";
                    }
                    else if(DateTime.now().month > value.month) { // anniversaire passé
                      mois = mois + (DateTime.now().month - value.month);
                      moisD1 = 12 - moisD;
                      jourD1 = DateTime.now().day + value.day;
                      result = "Vous avez déjà : " + annee.toString() + " ans !";
                      delai ="Votre anniversaire est déjà passé il y a " + moisD.toString() + " mois et " + jourD.toString() + " jours ! Le prochain sera dans " + moisD1.toString() + " mois et quelques jours soit dans " + jourD1.toString() + " jours.";
                    }
                    else if (DateTime.now().day == value.day && DateTime.now().month == value.month) { //jour j
                      result = "Joyeux anniversaire ! Vous venez d'avoir : " + annee.toString() + " ans !";
                      delai ="C'est le jour j ! Votre anniversaire sera désormais dans un an jour pour jour :) ";
                    }
                    else if ( DateTime.now().month == value.month) { //né le même mois mais pas le même jour
                      if (DateTime.now().day < value.day) { //pas encore son anniversaire
                        annee = annee - 1;
                        result = "Vous avez : " + annee.toString() + " ans !";
                        delai ="Votre anniversaire est dans " + moisD.toString() + " mois et " + jourD.toString() + " jours !";
                      } else { //c'est passé
                        moisD1 = 12 - moisD - 1; // pour pouvoir préciser le nombre de jour

                        result = "Vous avez déjà : " + annee.toString() + " ans !";
                        delai ="Votre anniversaire est déjà passé il y a " + moisD.toString() + " mois et " + jourD.toString() + " jours ! Le prochain sera dans " + moisD1.toString() + " mois et quelques jours soit dans " + jourD1.toString() + " jours.";

                      }
                    }
                    info = "Vous avez vécu jusqu'à maintenant " + annee.toString() + " ans  " + mois.toString() + " mois " + jour.toString() + " jours soit " + heure.toString() +" heures !";
                  })
                });
              },
            ),
            Text(""),
            Text(result, textAlign: TextAlign.center,style: TextStyle(
                fontSize: 15.0,
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)
            ),
            Text(""),
            Text(info, textAlign: TextAlign.center, style: TextStyle(
                fontSize: 15.0,
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
            Text(""),
            Text(delai,  textAlign: TextAlign.center, style: TextStyle(
                fontSize: 15.0,
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic))
          ],
        ),
      ),

    );
  }
}