// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kuisfarras/model/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class PokeDetailScreen extends StatefulWidget {
  final List<PokemonData> favorite;
  final PokemonData poke;
  const PokeDetailScreen({
    Key? key,
    required this.favorite,
    required this.poke,
  }) : super(key: key);

  @override
  State<PokeDetailScreen> createState() => _PokeDetailScreenState();
}

class _PokeDetailScreenState extends State<PokeDetailScreen> {
  bool isFavorite = false;

  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.poke);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tambah ke Favorit'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      } else {
        widget.favorite.remove(widget.poke);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hapus dari Favorit'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = widget.favorite.contains(widget.poke);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Detail Pokemon')),
        backgroundColor: Colors.redAccent.shade800,
        actions: [
          IconButton(
            onPressed: () {
              setFavorite();
            },
            icon: Icon(Icons.favorite, color: isFavorite ? Colors.blue : null),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.poke.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Pokemon Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.poke.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Type',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.poke.type.join(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Weakness',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.poke.weakness.join(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Previous Evolution',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.poke.prevEvolution.join(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Next Evolution',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.poke.nextEvolution.join(),
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent.shade800,
        onPressed: () {
          launchUrl(Uri.parse(widget.poke.image));
        },
        child: const Icon(
          Icons.search,
        ),
      ),
    );
  }
}
