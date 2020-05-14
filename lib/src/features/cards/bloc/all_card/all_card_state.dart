part of 'all_card_bloc.dart';

abstract class AllCardState extends Equatable {
  const AllCardState();

  @override
  List<Object> get props => [];
}

class AllCardEmpty extends AllCardState {}

class AllCardLoading extends AllCardState {}

class AllCardLoaded extends AllCardState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  AllCardLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  AllCardLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return AllCardLoaded(
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

class AllCardError extends AllCardState {}
