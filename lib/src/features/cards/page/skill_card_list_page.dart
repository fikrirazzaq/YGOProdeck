import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cards.dart';
import '../../../widgets/widgets.dart';

class SkillCardListPage extends StatefulWidget {
  @override
  _SkillCardListPageState createState() => _SkillCardListPageState();
}

class _SkillCardListPageState extends State<SkillCardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SkillCardBloc, SkillCardState>(
            builder: (context, state) => TmplCardList(
                typeCard: 'Skill',
                skillCardState: state,
                scrollController: _scrollController,
                title: 'Skill Cards',
                onRetryPressed: _fetchCardList)),
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    _cardListBloc = BlocProvider.of<SkillCardBloc>(context);
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

  void _fetchCardList() => _cardListBloc.add(FetchSkillCard());

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  SkillCardBloc _cardListBloc;
}
