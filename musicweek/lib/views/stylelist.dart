import 'package:flutter/material.dart';

import 'Home.dart';

class StyleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    return ListTile(
      tileColor: Colors.deepOrange[300],
      leading: Icon(choice.icon),
      title : Text(choice.title),
      onTap: () => choice.changeScreen(context, route),
    );
  }
}