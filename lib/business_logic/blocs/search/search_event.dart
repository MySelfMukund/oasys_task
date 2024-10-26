part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class SetSearchTextEvent extends SearchEvent {
  final String newSearchText;

  const SetSearchTextEvent({required this.newSearchText});

  factory SetSearchTextEvent.initial() =>
      const SetSearchTextEvent(newSearchText: '');

  @override
  String toString() => 'SetSearchTextEvent(newSearchText: $newSearchText)';

  SetSearchTextEvent copyWith({
    String? newSearchText,
  }) {
    return SetSearchTextEvent(
      newSearchText: newSearchText ?? this.newSearchText,
    );
  }

  @override
  List<Object> get props => [newSearchText];
}
