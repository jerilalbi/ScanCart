part of 'search_bloc.dart';

class SearchState {
  final bool isSearch;

  SearchState({required this.isSearch});
}

final class SearchInitial extends SearchState {
  SearchInitial() : super(isSearch: false);
}
