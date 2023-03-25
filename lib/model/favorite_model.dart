import 'package:kuisfarras/model/pokemon_data.dart';

class Favorite {
  final PokemonData? poke;
  final bool? isFavorite;

  Favorite({this.poke, this.isFavorite});

  var favoriteList = <Favorite>[];
}
