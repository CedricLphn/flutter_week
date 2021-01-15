import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:musicweek/views/stylegrid.dart';
import 'package:musicweek/views/stylecard.dart';
import 'package:musicweek/views/stylelist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String mode;
  SharedPreferences settings;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      settings = value;
      mode = value.getString("mode") ?? "grid";
    });
  }

  switchMode() {
    if(mode == "grid") {
      return StyleGrid();
    }else if(mode == "list") {
      return StyleView();
    }else {
      return StyleCard();
    }
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child:
              Text(
                "Utility app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
                decoration: BoxDecoration(
                    color: Colors.brown,
                ),
              ),
              ListTile(
                leading: Icon(Icons.grid_on),
                title: Text("Grid view"),
                onTap: () {
                  setState(() {
                    mode = "grid";
                  });
                  settings.setString("mode", "grid");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("List view"),
                onTap: () {
                  setState(() => mode = "list");
                  settings.setString("mode", "list");

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.article_outlined),
                title: Text("Card view"),
                onTap: () {
                  setState(() => mode = "card");
                  settings.setString("mode", "card");

                  Navigator.pop(context);
                },
              )

            ],
          ),
        ),
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text("Utility app"),
          backgroundColor: Colors.grey[850],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ecran2.jpg"),
                fit: BoxFit.cover),
          ),
          child: switchMode()
        )
      );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.route});
  final String title;
  final IconData icon;
  final String route;
  void changeScreen(BuildContext context, String name) {
    Navigator.pushNamed(context, name);
  }
}

//les differents choix personnalisés pour le menu
const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Conversion taille de fichiers informatique',
      icon: Icons.broken_image,
      route: '/bytes_converter'),
  const Choice(title: 'Connaître mon âge', icon: Icons.person, route: '/age'),
  const Choice(
      title: 'Calculer des promotions',
      icon: Icons.calculate,
      route: '/promotion'),
  const Choice(
      title: 'Calculer un temps écoulé', icon: Icons.timelapse, route: '/date'),
  const Choice(
      title: 'Convertir une distance',
      icon: Icons.edit_road,
      route: '/distance'),
  const Choice(
      title: 'Convertir des aires',
      icon: Icons.ac_unit,
      route: '/aires'),
  const Choice(
      title: 'Convertir des binaires',
      icon: Icons.all_inclusive,
      route: '/binaire'),
  const Choice(
      title: 'Convertir des températures',
      icon: Icons.ac_unit_sharp,
      route: '/temperature'),
  const Choice(
      title: 'Convertir décimal en chiffre romain',
      icon: Icons.calculate_outlined,
      route: '/romain'),
  const Choice(
      title: 'Playlist de music', icon: Icons.music_note, route: '/music'),
];

