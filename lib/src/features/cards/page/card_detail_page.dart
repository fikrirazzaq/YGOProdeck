import 'dart:async';

import 'package:YGOProdeck/src/features/favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../cards.dart';

class CardDetailPage extends StatefulWidget {
  final String cardName;

  const CardDetailPage({Key key, this.cardName}) : super(key: key);

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardName),
        backgroundColor: Colors.white,
        actions: [
          BlocBuilder<CardDetailBloc, CardDetailState>(
              builder: (context, state) {
            if (state is CardDetailLoaded) {
              return BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, favState) {
                  if (favState is ContainsFavorite) {
                    return IconButton(
                      onPressed: () {
                        _favoriteBloc.add(
                          ToggleFavorite(
                              card: Favorite(
                                  name: state.card.name,
                                  id: state.card.id,
                                  atk: state.card.atk,
                                  def: state.card.def,
                                  archetype: state.card.archetype,
                                  attribute: state.card.attribute,
                                  desc: state.card.desc,
                                  cardImage:
                                      state.card.cardImages.first.imageUrl,
                                  level: state.card.level,
                                  race: state.card.race,
                                  type: state.card.type)),
                        );
                        _favoriteBloc
                            .add(IsContainsFavorite(name: state.card.name));
                      },
                      icon: Icon(favState.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                    );
                  }
                  return SizedBox();
                },
              );
            }
            if (state is CardDetailError) {
              return IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              );
            }
            return SizedBox();
          }),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<CardDetailBloc, CardDetailState>(
              listener: (context, state) {
            if (state is CardDetailLoaded) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          }, builder: (context, state) {
            if (state is CardDetailLoaded) {
              return RefreshIndicator(
                color: Colors.black,
                onRefresh: () {
                  BlocProvider.of<CardDetailBloc>(context)
                      .add(RefreshCardDetail(cardName: widget.cardName));
                  return _refreshCompleter.future;
                },
                child: state.card.type.toLowerCase().contains('monster')
                    ? TmplMonsterDetailPage(state: state)
                    : TmplNonMonsterDetailPage(state: state),
              );
            }

            if (state is CardDetailError) {
              return MolLoadFailed(onRetryPressed: _fetchCardDetail);
            }

            return Center(child: AtmPrimaryLoading());
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    _refreshCompleter = Completer<void>();

    _cardDetailBloc = BlocProvider.of<CardDetailBloc>(context);
    _favoriteBloc = BlocProvider.of<FavoriteBloc>(context);

    _fetchCardDetail();
    super.initState();
  }

  void _fetchCardDetail() {
    _cardDetailBloc.add(InitFetchCard());
    _cardDetailBloc.add(FetchCardDetail(cardName: widget.cardName));
    _favoriteBloc.add(IsContainsFavorite(name: widget.cardName));
  }

  FavoriteBloc _favoriteBloc;
  CardDetailBloc _cardDetailBloc;
  Completer<void> _refreshCompleter;
}
