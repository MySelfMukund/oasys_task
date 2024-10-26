part of 'searched_cards_bloc.dart';

class SearchedCardsState extends Equatable {
  final List<PokemonModel>? searchedPokemonCards;
  const SearchedCardsState({required this.searchedPokemonCards});

  @override
  List<Object?> get props => [searchedPokemonCards];

  factory SearchedCardsState.initial() {
    return const SearchedCardsState(searchedPokemonCards: []);
  }

  @override
  bool get stringify => true;

  SearchedCardsState copyWith({
    List<PokemonModel>? searchedPokemonCards,
  }) {
    return SearchedCardsState(
      searchedPokemonCards: searchedPokemonCards ?? this.searchedPokemonCards,
    );
  }
}
