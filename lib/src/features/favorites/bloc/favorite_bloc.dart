import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../cards/cards.dart';
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
    if (event is InitFetchFavorite) {
      print("INITFETCH DETAIL");
      yield FavoriteEmpty();
    }
    if (event is FetchFavoriteCards) {
      print("INITFETCH DETAIL");
      try {
        final Box<Favorite> favorites = favoriteRepository.getFavoriteValues();
        yield FavoriteListLoaded(favorites);
      } catch (_) {
        yield FavoriteError();
      }
    }
    if (event is ToggleFavorite) {
      try {
        bool isFavorite = await favoriteRepository.toggleFavorite(event.card);

        yield ContainsFavorite(isFavorite);
      } catch (_) {
        yield FavoriteError();
      }
    }
  }
}
