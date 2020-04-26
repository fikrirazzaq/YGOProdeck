part of 'card_list_bloc.dart';

abstract class CardListEvent extends Equatable {
  const CardListEvent();
}

class FetchCardList extends CardListEvent {
  @override
  List<Object> get props => [];
}
