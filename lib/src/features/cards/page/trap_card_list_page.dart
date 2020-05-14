import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cards.dart';
import '../../../widgets/widgets.dart';

class TrapCardListPage extends StatefulWidget {
  @override
  _TrapCardListPageState createState() => _TrapCardListPageState();
}

class _TrapCardListPageState extends State<TrapCardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrapCardBloc, TrapCardState>(
          builder: (context, state) => TmplCardList(
              typeCard: 'Trap',
              trapCardState: state,
              scrollController: _scrollController,
              title: 'Trap Cards',
              onRetryPressed: _fetchCardList)),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    _cardListBloc = BlocProvider.of<TrapCardBloc>(context);
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

  void _fetchCardList() => _cardListBloc.add(FetchTrapCard());

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  TrapCardBloc _cardListBloc;
}
