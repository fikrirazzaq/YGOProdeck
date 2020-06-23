part of 'search_card_bloc.dart';

abstract class SearchCardEvent extends Equatable {
  const SearchCardEvent();
}

class InitFetchSearchCard extends SearchCardEvent {
  @override
  List<Object> get props => [];
}

class FetchSearchCard extends SearchCardEvent {
  final String keyword;

  FetchSearchCard({this.keyword});

  @override
  List<Object> get props => [keyword];
}
