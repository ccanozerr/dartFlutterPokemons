import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pokemons/models/pokedex.dart';
import 'package:pokemons/pokemon_detail.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String apiUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeDex pokeDex;
  Future<PokeDex> data;

  Future<PokeDex> getPokemons() async {
    var response = await http.get(apiUrl);
    var decodedJson = json.decode(response.body);
    pokeDex = PokeDex.fromJson(decodedJson);
    return pokeDex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PokeDex> pokeDexResponse) {
                if (pokeDexResponse.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (pokeDexResponse.connectionState ==
                    ConnectionState.done) {
                  //if you want to use GridView.builder
                  /*return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(snapshot.data.pokemon[index].name);
                  });*/
                  //if you want to use GridView.count
                  return GridView.count(
                    crossAxisCount: 2,
                    children: pokeDexResponse.data.pokemon.map((pokemon) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetail(
                                    pokemon: pokemon,
                                  )));
                        },
                        child: Hero(
                          tag: pokemon.img,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 142.5,
                                  width: 148.8,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: pokemon.img),
                                ),
                                Expanded(
                                  child: Text(
                                    pokemon.name,
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return null;
                }
              },
            );
          } else {
            return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PokeDex> pokeDexResponse) {
                if (pokeDexResponse.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (pokeDexResponse.connectionState ==
                    ConnectionState.done) {
                  //if you want to use GridView.builder
                  /*return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(snapshot.data.pokemon[index].name);
                  });*/
                  //if you want to use GridView.count
                  return GridView.extent(
                    maxCrossAxisExtent: 300,
                    children: pokeDexResponse.data.pokemon.map((pokemon) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetail(
                                    pokemon: pokemon,
                                  )));
                        },
                        child: Hero(
                          tag: pokemon.img,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 170,
                                  width: 110,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: pokemon.img),
                                ),
                                Text(
                                  pokemon.name,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return null;
                }
              },
            );
          }
        },
      ),
    );
  }
}
