import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/models/pokedex.dart';

// ignore: must_be_immutable
class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.shade700,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return verticalBody(context);
          } else {
            return horizontalBody(context);
          }
        },
      ),
    );
  }

  Widget horizontalBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Height: " + pokemon.height.toString(),
                  ),
                  Text(
                    "Weight: " + pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((type) => Chip(
                            backgroundColor: Colors.tealAccent.shade400,
                            label: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolutions",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((prevEvolution) => Chip(
                                backgroundColor: Colors.tealAccent.shade400,
                                label: Text(
                                  prevEvolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("That pokeman is first evolution.")],
                  ),
                  Text(
                    "Next Evolutions",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.tealAccent.shade400,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("That pokeman is last evolution.")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weaknesses) => Chip(
                                backgroundColor: Colors.tealAccent.shade400,
                                label: Text(
                                  weaknesses,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("There is no weaknesses.")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack verticalBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Height: " + pokemon.height.toString(),
                ),
                Text(
                  "Weight: " + pokemon.weight,
                ),
                Text(
                  "Types",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((type) => Chip(
                          backgroundColor: Colors.tealAccent.shade400,
                          label: Text(
                            type,
                            style: TextStyle(color: Colors.white),
                          )))
                      .toList(),
                ),
                Text(
                  "Pre Evolutions",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.prevEvolution != null
                      ? pokemon.prevEvolution
                          .map((prevEvolution) => Chip(
                              backgroundColor: Colors.tealAccent.shade400,
                              label: Text(
                                prevEvolution.name,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("That pokeman is first evolution.")],
                ),
                Text(
                  "Next Evolutions",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((evolution) => Chip(
                              backgroundColor: Colors.tealAccent.shade400,
                              label: Text(
                                evolution.name,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("That pokeman is last evolution.")],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((weaknesses) => Chip(
                              backgroundColor: Colors.tealAccent.shade400,
                              label: Text(
                                weaknesses,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("There is no weaknesses.")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
