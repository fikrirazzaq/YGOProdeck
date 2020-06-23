part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class InitFetchFavorite extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class ToggleFavorite extends FavoriteEvent {
  final Favorite card;

  ToggleFavorite({@required this.card}) : assert(card != null);

  @override
  List<Object> get props => [card];
}

class IsContainsFavorite extends FavoriteEvent {
  final String name;

  IsContainsFavorite({@required this.name}) : assert(name != null);

  @override
  List<Object> get props => [name];
}
