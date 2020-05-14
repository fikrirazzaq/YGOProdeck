import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cards.dart';
import '../../../widgets/widgets.dart';

class AllCardListPage extends StatefulWidget {
  @override
  _AllCardListPageState createState() => _AllCardListPageState();
}

class _AllCardListPageState extends State<AllCardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllCardBloc, AllCardState>(
          builder: (context, state) => TmplCardList(
              typeCard: 'All',
              allCardState: state,
              scrollController: _scrollController,
              title: 'All Cards',
              onRetryPressed: _fetchCardList)),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    _cardListBloc = BlocProvider.of<AllCardBloc>(context);

    _fetchCardList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) _fetchCardList();
  }

  void _fetchCardList() => _cardListBloc.add(FetchAllCard());

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  AllCardBloc _cardListBloc;
}
