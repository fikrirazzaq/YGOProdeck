part of 'spell_card_bloc.dart';

abstract class SpellCardState extends Equatable {
  const SpellCardState();

  @override
  List<Object> get props => [];
}

class SpellCardEmpty extends SpellCardState {}

class SpellCardLoading extends SpellCardState {}

class SpellCardLoaded extends SpellCardState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  SpellCardLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  SpellCardLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return SpellCardLoaded(
      cards: cards ?? this.cards,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [cards, hasReachedMax];

  @override
  String toString() =>
      'SpellCardLoaded { cards: ${cards.length}, hasReachedMax: $hasReachedMax }';
}

class SpellCardError extends SpellCardState {}
