import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonName = ModalRoute.of(context).settings.arguments as String;
    final pokemonIcon = ModalRoute.of(context).settings.arguments as IconData;
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName),
      ),
      body: Icon(pokemonIcon),
    );
  }
}
