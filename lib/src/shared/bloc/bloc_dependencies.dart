import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/_main_menu/main_menu.dart';
import '../../features/cards/cards.dart';
import '../../features/favorites/favorites.dart';

List<BlocProvider> providers = [
  BlocProvider<MainMenuBloc>(create: (context) => MainMenuBloc()),
  BlocProvider<AllCardBloc>(
      create: (context) => AllCardBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
  BlocProvider<SpellCardBloc>(
      create: (context) => SpellCardBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
  BlocProvider<SkillCardBloc>(
      create: (context) => SkillCardBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
  BlocProvider<TrapCardBloc>(
      create: (context) => TrapCardBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
  BlocProvider<CardDetailBloc>(
      create: (context) => CardDetailBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()),
          favoriteRepository:
              FavoriteRepository(favoriteDbProvider: FavoriteDbProvider()))),
  BlocProvider<FilterCardBloc>(create: (context) => FilterCardBloc()),
  BlocProvider<SortCardBloc>(create: (context) => SortCardBloc()),
  BlocProvider<FavoriteBloc>(create: (context) => FavoriteBloc()),
];
