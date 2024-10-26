import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<SetSearchTextEvent>((event, emit) {
      emit(state.copyWith(searchText: event.newSearchText));
    }, transformer: debounce(const Duration(milliseconds: 1000)));
  }

  //Below  is  for debounce for search
  EventTransformer<SetSearchTextEvent> debounce<SetSearchTextEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
