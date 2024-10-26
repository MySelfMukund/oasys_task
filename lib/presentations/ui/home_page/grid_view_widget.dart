import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/models/models.dart';
import 'bottom_sheet_card_details.dart';

class GridViewWidget extends StatelessWidget {
  List<PokemonModel> setSearchedCards(
      List<PokemonModel> cardsList, String searchText) {
    List<PokemonModel> searchedCardsList;

    if (searchText.isEmpty) {
      searchedCardsList = cardsList;
    } else {
      searchedCardsList = cardsList
          .where((card) =>
              card.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }

    return searchedCardsList;
  }

  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PokemonModel> pokemonCardsList =
        context.watch<SearchedCardsBloc>().state.searchedPokemonCards!;
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchBloc, SearchState>(
          listener: (context, state) {
            final searchedCards = setSearchedCards(
              context.read<PokemonBloc>().state.listPokemonCards!,
              state.searchText,
            );
            context.read<SearchedCardsBloc>().add(CalculateSearchedCardsEvent(
                searchedPokemonCards: searchedCards));
          },
        ),
        BlocListener<PokemonBloc, PokemonState>(
          listener: (context, state) {
            final searchedCards = setSearchedCards(
              state.listPokemonCards!,
              context.read<SearchBloc>().state.searchText,
            );
            context.read<SearchedCardsBloc>().add(CalculateSearchedCardsEvent(
                searchedPokemonCards: searchedCards));
          },
        ),
      ],
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemonCardsList.length,
        itemBuilder: (context, index) {
          final card = pokemonCardsList[index];
          return GestureDetector(
            onTap: () => _showCardDetails(context, card, 'heroTag$index'),
            child: Hero(
              tag: 'heroTag$index',
              child: Card(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      fadeInDuration: const Duration(seconds: 1),
                      imageUrl: card.images!.large,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        card.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCardDetails(
      BuildContext context, PokemonModel card, String heroTag) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BottomSheetCardDetails(
        card: card,
        heroTag: heroTag,
      ),
    );
  }
}
