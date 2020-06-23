part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class AddRemoveFavoriteResult extends FavoriteState {
  bool isFavorite;

  AddRemoveFavoriteResult(this.isFavorite) : assert(isFavorite != null);

  @override
  List<Object> get props => [isFavorite];
}

class ContainsFavorite extends FavoriteState {
  bool isFavorite;

  ContainsFavorite(this.isFavorite) : assert(isFavorite != null);

  @override
  List<Object> get props => [isFavorite];
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteError extends FavoriteState {}
