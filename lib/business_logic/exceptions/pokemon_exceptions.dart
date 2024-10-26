class PokemonExceptions implements Exception {
  String message;
  PokemonExceptions([this.message = 'Something went wrong']) {
    message = 'Fetch Pokemon Exception $message';
  }

  @override
  String toString() => message;
}
