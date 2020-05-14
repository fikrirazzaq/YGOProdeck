part of 'skill_card_bloc.dart';

abstract class SkillCardState extends Equatable {
  const SkillCardState();

  @override
  List<Object> get props => [];
}

class SkillCardEmpty extends SkillCardState {}

class SkillCardLoading extends SkillCardState {}

class SkillCardLoaded extends SkillCardState {
  final List<CardListData> cards;
  final bool hasReachedMax;

  SkillCardLoaded({@required this.cards, @required this.hasReachedMax})
      : assert(cards != null, hasReachedMax != null);

  SkillCardLoaded copyWith({
    List<CardListData> cards,
    bool hasReachedMax,
  }) {
    return SkillCardLoaded(
      cards: cards ?? this.cards,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [cards, hasReachedMax];

  @override
  String toString() =>
      'SkillCardLoaded { cards: ${cards.length}, hasReachedMax: $hasReachedMax }';
}

class SkillCardError extends SkillCardState {}
