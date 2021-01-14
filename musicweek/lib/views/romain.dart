import 'package:flutter/material.dart';

class Romain extends StatefulWidget {
  @override
  _RomainState createState() => _RomainState();
}

class _RomainState extends State<Romain> {

  int chiffre = 0;
  String romain = "";

  var controller_chiffre = TextEditingController();
  var controller_romain = TextEditingController();



  String convert_decimal_to_romain(int number) {

    List<String> chiffre_romain = ['M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I'];
    List<int> valeur_decimal = [1000,900,500,400,100,90,50,40,10,9,5,4,1];

    String converted = "";
    print("nombre a convertir: $number");
    int decimal = number;
    for(int i = 0; i < valeur_decimal.length; i++) {
      int repeat = (decimal / valeur_decimal[i]).toInt();
      print(repeat);
      for(int j = 0; j < repeat; j++) {
        converted += chiffre_romain[i];
      }
      decimal = decimal -  repeat * valeur_decimal[i];
    }
    return converted;
  }

  int getValue(String r) {
    List<String> tableau = ['M','D','C','L','X','V','I'];
    List<int> valeur = [1000,500,100,50,10,5,1];

    if(tableau.indexOf(r) != -1) {
      return valeur[tableau.indexOf(r)];
    }

    return 0;
  }

  int convert_romain_to_decimal(String romain) {

    int decode = 0;

    if(romain.length == 1) {
      return getValue(romain);
    }else if(getValue(romain[0]) < getValue(romain[1])) {
      decode = convert_romain_to_decimal(romain.substring(1, romain.length)) - getValue(romain[0]);
    }else {
      decode = convert_romain_to_decimal(romain.substring(1, romain.length)) + getValue(romain[0]);
    }
    return decode;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chiffre romain"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: 400,
                child: Card(
                  child: Row(
                    children: [
                      Flexible(child:
                  TextFormField(
                        controller: controller_chiffre,
                          onChanged: (chiffre) {
                            if(int.tryParse(chiffre) != null) {
                              controller_romain.text = convert_decimal_to_romain(int.parse(chiffre));
                            }

                          },
                          decoration: const InputDecoration(
                              labelText: "Chiffre décimal"
                          )
                      )
                      ),
                      Flexible(child: TextFormField(
                          controller: controller_romain,
                          onChanged: (event) {
                            if(event != null) {
                              controller_chiffre.text = convert_romain_to_decimal(event).toString();
                            }
                          },
                          decoration: const InputDecoration(
                              labelText: "Chiffre romain"
                          )
                      )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Card(
                  child: Column(
                    children: [
                      Text("Tableau de correspondance"),
                      Text("I = 1"),
                      Text("V = 5"),
                      Text("X = 10"),
                      Text("L = 50"),
                      Text("D = 500"),
                      Text("C = 1000"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

