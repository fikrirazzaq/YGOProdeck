part of 'spell_card_bloc.dart';

abstract class SpellCardEvent extends Equatable {
  const SpellCardEvent();
}

class InitFetchSpellCard extends SpellCardEvent {
  @override
  List<Object> get props => [];
}

class FetchSpellCard extends SpellCardEvent {
  @override
  List<Object> get props => [];
}

class RefreshSpellCard extends SpellCardEvent {
  @override
  List<Object> get props => [];
}
