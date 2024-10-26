import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/pokemon_model.dart';

part 'searched_cards_event.dart';
part 'searched_cards_state.dart';

class SearchedCardsBloc extends Bloc<SearchedCardsEvent, SearchedCardsState> {
  final List<PokemonModel> intialPokemonCards;
  SearchedCardsBloc({required this.intialPokemonCards})
      : super(SearchedCardsState(searchedPokemonCards: intialPokemonCards)) {
    on<CalculateSearchedCardsEvent>((event, emit) {
      emit(state.copyWith(searchedPokemonCards: event.searchedPokemonCards));
    });
  }
}
