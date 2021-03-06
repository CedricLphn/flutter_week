import 'dart:io';

import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  //Promotion({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  String prixOrigine = "";
  String promotion = "";
  String prixEco = "";
  String prixFinal = "";
  double promo;
  double prix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Calculer promotion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Indiquez le prix d'origine :",
              style: TextStyle(color: Colors.white54),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (String monPrixOrigine) {
                setState(() {
                  //pas de changement sans cette methode, les etats sont au centre de flutter
                  prixOrigine = monPrixOrigine;
                });
              },
              decoration: new InputDecoration(labelText: "00.00€"),
            ),
            Text("€"),
            Text(""),
            Text(
              "Indiquez la promotion : ",
              style: TextStyle(color: Colors.white54),
            ),
            TextField(
              onChanged: (String maPromo) {
                setState(() {
                  //pas de changement sans cette methode, les etats sont au centre de flutter
                  promotion = maPromo;
                });
              },
              decoration: new InputDecoration(labelText: "0%"),
            ),
            Text("%"),
            new Icon(
              Icons.monetization_on_rounded,
              color: Colors.brown,
            ),
            TextButton(onPressed: calculPromo, child: new Text("Valider")),
            Text(prixEco),
            Text(prixFinal)
          ],
        ),
      ),
    );
  }

  void calculPromo() {
    setState(() {
      promo = double.parse(promotion);
      prix = double.parse(prixOrigine);
      promo = promo / 100;
      if (promo > 1) {
        prixEco = "Attention, le taux ne doit pas être supérieur à 100%";
        prixFinal = "";
      } else {
        prixEco = "Vous avez économisé : " + (prix * promo).toString() + " €";

        prixFinal = "Le prix après réduction de " +
            promotion +
            "% est de " +
            (prix - (prix * promo)).toString() +
            " €";
      }
    });
  }
}
