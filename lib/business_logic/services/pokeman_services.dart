import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_card_list/business_logic/exceptions/pokemon_exceptions.dart';
import 'package:pokemon_card_list/business_logic/models/models.dart';
import 'package:pokemon_card_list/core/constants/constants.dart';

import 'http_error_handler.dart';

class PokemonServices {
  // final http.Client httpClient;
  PokemonServices();

  Future<List<PokemonModel>?> fetchPokemonCards() async {
    Uri uri = Uri.parse(kBaseUrl);

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw PokemonExceptions('No Pokemon Cards Found');
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        return data.map((json) => PokemonModel.fromJson(json)).toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
