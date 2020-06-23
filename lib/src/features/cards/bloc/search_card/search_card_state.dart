part of 'search_card_bloc.dart';

abstract class SearchCardState extends Equatable {
  const SearchCardState();

  @override
  List<Object> get props => [];
}

class SearchCardEmpty extends SearchCardState {
  @override
  String toString() => 'AllCardEmpty { cards: []]}';
}

class SearchCardLoading extends SearchCardState {}

class SearchCardLoaded extends SearchCardState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  SearchCardLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  SearchCardLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return SearchCardLoaded(
      cards: cards ?? this.cards,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [cards, hasReachedMax];

  @override
  String toString() =>
      'CardListLoaded { cards: ${cards.length}, hasReachedMax: $hasReachedMax }';
}

class SearchCardError extends SearchCardState {
  @override
  String toString() => 'AllCardError { cards: Err]}';
}
