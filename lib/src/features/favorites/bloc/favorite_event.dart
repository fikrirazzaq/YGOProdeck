part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class InitFetchFavorite extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class ToggleFavorite extends FavoriteEvent {
  final CardDetailData card;

  ToggleFavorite({@required this.card}) : assert(card != null);

  @override
  List<Object> get props => [card];
}

class FetchFavoriteCards extends FavoriteEvent {
  FetchFavoriteCards();

  @override
  List<Object> get props => [];
}
