import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../favorites/favorites.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteBloc({@required this.favoriteRepository});

  @override
  FavoriteState get initialState => FavoriteEmpty();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleFavorite) {
      try {
        await favoriteRepository.toggleFavorite(event.card);
        bool isFavorite = favoriteRepository.containsFavorite(event.card.name);
        yield AddRemoveFavoriteResult(isFavorite);
      } catch (_) {
        yield FavoriteError();
      }
    }
    if (event is IsContainsFavorite) {
      try {
        bool isFavorite = favoriteRepository.containsFavorite(event.name);
        yield ContainsFavorite(isFavorite);
      } catch (_) {
        yield FavoriteError();
      }
    }
  }
}
