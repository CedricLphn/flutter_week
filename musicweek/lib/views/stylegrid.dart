import 'package:flutter/material.dart';

import 'Home.dart';

class StyleGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        children: List.generate(choices.length, (index) {
          return Center(
              child: SelectCard(
                choice: choices[index],
                route: choices[index].route,
              ));
        }));
  }

}

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