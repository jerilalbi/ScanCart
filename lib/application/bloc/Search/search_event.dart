part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class ChangeSearching extends SearchEvent{
  final bool? value;
  ChangeSearching({this.value});
}
