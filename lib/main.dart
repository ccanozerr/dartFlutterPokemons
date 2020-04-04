import 'package:flutter/material.dart';
import 'package:pokemons/models/pokemon_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon List Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: PokemonList(),
    );
  }
}