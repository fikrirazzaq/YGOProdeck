part of 'card_list_bloc.dart';

abstract class CardListState extends Equatable {
  const CardListState();

  @override
  List<Object> get props => [];
}

class CardListEmpty extends CardListState {}

class CardListLoaded extends CardListState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  CardListLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  CardListLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return CardListLoaded(
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

class CardListError extends CardListState {}
