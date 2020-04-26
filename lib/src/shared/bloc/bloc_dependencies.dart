import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<CardListBloc>(
      create: (context) => CardListBloc(
          cardRepository: CardRepository(cardApiProvider: CardApiProvider()))),
];
