import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        leading: Icon(Icons.home),
        actions: [Icon(Icons.more_vert)],
        title: Text("Flutter GridView Demo"),
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            children: List.generate(choices.length, (index) {
              return Center(
                  child: SelectCard(
                choice: choices[index],
                route: choices[index].route,
              ));
            })),
      ),
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

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice, this.route}) : super(key: key);
  final Choice choice;
  final String route;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText2;
    return Card(
      color: Colors.deepOrange[300],
      child: InkWell(
        //highlightColor: Colors.red,
        splashColor: Colors.purpleAccent,
        radius: 100,
        onTap: () => choice.changeScreen(context, route),

        child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child:
                        Icon(choice.icon, size: 50.0, color: textStyle.color)),
                Text(
                  choice.title,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}