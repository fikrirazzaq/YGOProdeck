import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cards.dart';
import '../../../widgets/widgets.dart';

class SpellCardListPage extends StatefulWidget {
  @override
  _SpellCardListPageState createState() => _SpellCardListPageState();
}

class _SpellCardListPageState extends State<SpellCardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SpellCardBloc, SpellCardState>(
            builder: (context, state) => TmplCardList(
                typeCard: 'Spell',
                spellCardState: state,
                scrollController: _scrollController,
                title: 'Spell Cards',
                onRetryPressed: _fetchCardList)),
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    _cardListBloc = BlocProvider.of<SpellCardBloc>(context);
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

  void _fetchCardList() => _cardListBloc.add(FetchSpellCard());

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  SpellCardBloc _cardListBloc;
}
