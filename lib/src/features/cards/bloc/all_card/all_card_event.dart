part of 'all_card_bloc.dart';

abstract class AllCardEvent extends Equatable {
  const AllCardEvent();
}

class InitFetchAllCard extends AllCardEvent {
  @override
  List<Object> get props => [];
}

class FetchAllCard extends AllCardEvent {
  @override
  List<Object> get props => [];
}

class RefreshAllCard extends AllCardEvent {
  @override
  List<Object> get props => [];
}
