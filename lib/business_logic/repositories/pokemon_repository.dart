import 'package:pokemon_card_list/business_logic/exceptions/pokemon_exceptions.dart';
import 'package:pokemon_card_list/business_logic/models/custom_error.dart';
import 'package:pokemon_card_list/business_logic/services/pokeman_services.dart';

import '../models/pokemon_model.dart';

class PokemonRepository {
  final PokemonServices pokemonServices;

  PokemonRepository({required this.pokemonServices});

  Future<List<PokemonModel>?> fetchPokemonCards() async {
    try {
      final List<PokemonModel>? cardList =
          await pokemonServices.fetchPokemonCards();
      return cardList;
    } on PokemonExceptions catch (e) {
      throw CustomError(errMessage: e.toString());
    } catch (e) {
      throw CustomError(errMessage: e.toString());
    }
  }
}
