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
      body: SafeArea(
        child: BlocBuilder<AllCardBloc, AllCardState>(
            builder: (context, state) => TmplCardList(
                typeCard: 'All',
                allCardState: state,
                scrollController: _scrollController,
                title: 'All Cards',
                onRetryPressed: _fetchCardList)),
      ),
    );
  }

  @override
  void initState() {
    _cardQueryParams = CardQueryParams();

    _scrollController.addListener(_onScroll);
    _filterCardBloc = BlocProvider.of<FilterCardBloc>(context);
    _sortCardBloc = BlocProvider.of<SortCardBloc>(context);
    _cardListBloc = BlocProvider.of<AllCardBloc>(context);

    _filterCardBloc.listen((state) {
      setState(() {
        _cardQueryParams.type = state.cardTypeSelected ?? '';
        _cardQueryParams.attribute =
            state.attributeSelected == null || state.attributeSelected == ''
                ? ''
                : state.attributeSelected;
        _cardQueryParams.race =
            state.raceSelected == null || state.raceSelected == ''
                ? ''
                : state.raceSelected;
        _cardQueryParams.level =
            state.level == 0 || state.level == -1 ? '' : state.level.toString();
        _cardQueryParams.banlist = state.banListSelected ?? '';
        _cardQueryParams.atk =
            state.atk == null || state.atk == '' || state.atk == '-1'
                ? ''
                : state.atk;
        _cardQueryParams.def =
            state.def == null || state.def == '' || state.def == '-1'
                ? ''
                : state.def;
      });
    });

    _sortCardBloc.listen((state) {
      setState(() {
        _cardQueryParams.sort = state.sortSelected ?? '';
      });
    });

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

  void _fetchCardList() {
    _cardListBloc.add(FetchAllCard(params: _cardQueryParams));
  }

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  AllCardBloc _cardListBloc;
  FilterCardBloc _filterCardBloc;
  SortCardBloc _sortCardBloc;

  CardQueryParams _cardQueryParams;
}
