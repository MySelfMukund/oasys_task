part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, loading, success, failure }

class PokemonState extends Equatable {
  final PokemonStatus status;
  final CustomError? error;
  final List<PokemonModel>? listPokemonCards; // PokeMonModel pokeManModel;

  const PokemonState(
      {required this.status, this.error, required this.listPokemonCards});

  factory PokemonState.initial() {
    return const PokemonState(
        status: PokemonStatus.initial,
        error: CustomError(),
        listPokemonCards: []);
  }

  PokemonState copyWith({
    PokemonStatus? status,
    CustomError? error,
    List<PokemonModel>? listOfCards,
  }) {
    return PokemonState(
      status: status ?? this.status,
      error: error ?? this.error,
      listPokemonCards: listOfCards ?? listPokemonCards,
    );
  }

  @override
  List<Object?> get props => [status, error ?? '', listPokemonCards ?? ''];

  @override
  bool get stringify => true;
}
