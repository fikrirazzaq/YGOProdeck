part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteListLoaded extends FavoriteState {
  final Box<Favorite> favorites;

  FavoriteListLoaded(this.favorites);

  @override
  List<Object> get props => [];
}

class ContainsFavorite extends FavoriteState {
  bool isFavorite;

  ContainsFavorite(this.isFavorite) : assert(isFavorite != null);

  @override
  List<Object> get props => [];
}

class FavoriteError extends FavoriteState {}
