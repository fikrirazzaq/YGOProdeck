part of 'card_detail_bloc.dart';

abstract class CardDetailState extends Equatable {
  const CardDetailState();

  @override
  List<Object> get props => [];
}

class CardDetailEmpty extends CardDetailState {}

class CardDetailLoaded extends CardDetailState {
  final CardDetailData card;

  CardDetailLoaded({@required this.card}) : assert(card != null);

  CardDetailLoaded copyWith({List<CardDetailData> cards}) {
    return CardDetailLoaded(card: card ?? this.card);
  }

  @override
  List<Object> get props => [card];

  @override
  String toString() => 'CardDetailLoaded { cards: ${card.name} }';
}

class CardDetailError extends CardDetailState {}
