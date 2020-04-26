part of 'card_list_bloc.dart';

abstract class CardListState extends Equatable {
  const CardListState();

  @override
  List<Object> get props => [];
}

class CardListEmpty extends CardListState {}

class CardListLoading extends CardListState {}

class CardListLoaded extends CardListState {
  final CardListResponse cards;

  CardListLoaded({@required this.cards}) : assert(cards != null);

  @override
  List<Object> get props => [cards];
}

class CardListError extends CardListState {}
