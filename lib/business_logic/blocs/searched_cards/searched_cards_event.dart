part of 'searched_cards_bloc.dart';

sealed class SearchedCardsEvent extends Equatable {
  const SearchedCardsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CalculateSearchedCardsEvent extends SearchedCardsEvent {
  final List<PokemonModel> searchedPokemonCards;
  const CalculateSearchedCardsEvent({required this.searchedPokemonCards});
}
