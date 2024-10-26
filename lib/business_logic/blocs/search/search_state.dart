part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String searchText;

  @override
  // TODO: implement props
  List<Object?> get props => [searchText];

  const SearchState({required this.searchText});

  factory SearchState.initial() {
    return const SearchState(searchText: '');
  }
  @override
  bool get stringify => true;

  SearchState copyWith({
    String? searchText,
  }) {
    return SearchState(
      searchText: searchText ?? this.searchText,
    );
  }
}
