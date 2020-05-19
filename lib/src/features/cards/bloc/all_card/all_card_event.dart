part of 'all_card_bloc.dart';

abstract class AllCardEvent extends Equatable {
  const AllCardEvent();
}

class InitFetchAllCard extends AllCardEvent {
  @override
  List<Object> get props => [];
}

class FetchAllCard extends AllCardEvent {
  final CardQueryParams params;

  FetchAllCard({this.params});

  @override
  List<Object> get props => [params];
}

class RefreshAllCard extends AllCardEvent {
  @override
  List<Object> get props => [];
}
