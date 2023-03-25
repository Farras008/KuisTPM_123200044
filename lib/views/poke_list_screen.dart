import 'package:flutter/material.dart';

import 'package:kuisfarras/views/poke_detail.dart';

import 'package:kuisfarras/model/pokemon_data.dart';

class PokeListScreen extends StatefulWidget {
  const PokeListScreen({super.key});

  @override
  State<PokeListScreen> createState() => _PokeListScreenState();
}

class _PokeListScreenState extends State<PokeListScreen> {
  var pokeFavorite = <PokemonData>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Center(child: Text('Pokemon')),
        backgroundColor: Colors.redAccent.shade800,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          PokemonData poke = listPokemon[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PokeDetailScreen(
                      favorite: pokeFavorite,
                      poke : poke,
                    ),
                  ),
                );
              },
              child: cardContent(listPokemon[index], context),
            ),
          );
        },
        itemCount: listPokemon.length,
      ),
    );
  }
}

cardContent(var poke, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              poke.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          poke.name,
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.clip,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
