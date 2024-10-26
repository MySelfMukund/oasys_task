import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_card_list/business_logic/models/models.dart';
import 'package:pokemon_card_list/business_logic/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonRepository pokemonRepository;

  PokemonBloc({required this.pokemonRepository})
      : super(PokemonState.initial()) {
    on<FetchPokemonEvent>(_fetchPokemonCards);
  }

  Future<void> _fetchPokemonCards(
    FetchPokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(state.copyWith(status: PokemonStatus.loading));
    try {
      final List<PokemonModel>? cardList =
          await pokemonRepository.fetchPokemonCards();
      emit(state.copyWith(
          status: PokemonStatus.success, listOfCards: cardList!));
    } on CustomError catch (e) {
      emit(state.copyWith(status: PokemonStatus.failure, error: e));
    }
  }
}
