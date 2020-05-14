part of 'trap_card_bloc.dart';

abstract class TrapCardEvent extends Equatable {
  const TrapCardEvent();
}

class InitFetchTrapCard extends TrapCardEvent {
  @override
  List<Object> get props => [];
}

class FetchTrapCard extends TrapCardEvent {
  @override
  List<Object> get props => [];
}

class RefreshTrapCard extends TrapCardEvent {
  @override
  List<Object> get props => [];
}
