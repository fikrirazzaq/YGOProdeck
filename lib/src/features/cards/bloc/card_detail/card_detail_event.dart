part of 'card_detail_bloc.dart';

abstract class CardDetailEvent extends Equatable {
  const CardDetailEvent();
}

class InitFetchCard extends CardDetailEvent {
  @override
  List<Object> get props => [];
}

class FetchCardDetail extends CardDetailEvent {
  final String cardName;

  FetchCardDetail({@required this.cardName}) : assert(cardName != null);

  @override
  List<Object> get props => [cardName];
}

class RefreshCardDetail extends CardDetailEvent {
  final String cardName;

  RefreshCardDetail({@required this.cardName}) : assert(cardName != null);

  @override
  List<Object> get props => [cardName];
}
