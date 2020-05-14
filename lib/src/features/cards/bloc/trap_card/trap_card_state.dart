part of 'trap_card_bloc.dart';

abstract class TrapCardState extends Equatable {
  const TrapCardState();

  @override
  List<Object> get props => [];
}

class TrapCardEmpty extends TrapCardState {}

class TrapCardLoading extends TrapCardState {}

class TrapCardLoaded extends TrapCardState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  TrapCardLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  TrapCardLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return TrapCardLoaded(
      cards: cards ?? this.cards,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [cards, hasReachedMax];

  @override
  String toString() =>
      'TrapCardLoaded { cards: ${cards.length}, hasReachedMax: $hasReachedMax }';
}

class TrapCardError extends TrapCardState {}
