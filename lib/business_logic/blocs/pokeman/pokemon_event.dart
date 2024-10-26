part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class FetchPokemonEvent extends PokemonEvent {
  const FetchPokemonEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
