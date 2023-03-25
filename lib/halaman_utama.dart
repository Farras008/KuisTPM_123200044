import 'package:flutter/material.dart';

//import 'halaman_detail.dart';
import 'pokemon_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData place = listPokemon[index];
            return InkWell(
              onTap: (){
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HalamanDetail(pokemon: place,),),
                // );
              },
              child: Card(
                child: Row (
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: 300,
                      child: Image.network(place.image),

                    ),
                   Column (
                      children:[Text(place.name,style: TextStyle(fontSize: 12)),
                    ]
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
