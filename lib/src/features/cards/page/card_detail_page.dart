import 'dart:async';

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
              return IconButton(
                onPressed: () {},
                icon: Icon(state.card.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
              );
            }
            if (state is CardDetailError) {
              return IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              );
            }
            return Container();
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
                  BlocProvider.of<CardDetailBloc>(context).add(
                    RefreshCardDetail(cardName: widget.cardName),
                  );
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
    super.initState();
    _refreshCompleter = Completer<void>();

    cardDetailBloc = BlocProvider.of<CardDetailBloc>(context);

    _fetchCardDetail();
  }

  void _fetchCardDetail() {
    cardDetailBloc.add(InitFetchCard());
    cardDetailBloc.add(FetchCardDetail(cardName: widget.cardName));
  }

  Completer<void> _refreshCompleter;
  CardDetailBloc cardDetailBloc;
}
