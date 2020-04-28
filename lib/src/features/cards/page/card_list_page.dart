import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  CardListBloc _cardListBloc;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    _cardListBloc = BlocProvider.of<CardListBloc>(context);
    _cardListBloc.add(FetchCardList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AtmTextHeading4(text: 'All Cards'),
      ),
      body: BlocBuilder<CardListBloc, CardListState>(
        builder: (context, state) {
          if (state is CardListLoaded) {
            if (state.cards.isEmpty) {
              return Center(
                child: Text('No cards found.'),
              );
            }

            return TmplCardList(
                cards: state.cards,
                hasReachedMax: state.hasReachedMax,
                scrollController: _scrollController);
          }

          if (state is CardListError) {
            return Center(
              child: Text('Failed to fetch cards.'),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _cardListBloc.add(FetchCardList());
    }
  }
}
