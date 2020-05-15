import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cards/cards.dart';

List<BlocProvider> providers = [
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
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
  BlocProvider<FilterSortCardBloc>(create: (context) => FilterSortCardBloc()),
];
