import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../cards.dart';

class AllCardListPage extends StatefulWidget {
  @override
  _AllCardListPageState createState() => _AllCardListPageState();
}

class _AllCardListPageState extends State<AllCardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<FilterCardBloc, FilterCardState>(
          listener: (context, state) {
            setState(() {
              _cardQueryParams.type = state.cardTypeSelected ?? '';
              _cardQueryParams.attribute = state.attributeSelected == null ||
                      state.attributeSelected == ''
                  ? ''
                  : state.attributeSelected;
              _cardQueryParams.race =
                  state.raceSelected == null || state.raceSelected == ''
                      ? ''
                      : state.raceSelected;
              _cardQueryParams.level = state.level == 0 || state.level == -1
                  ? ''
                  : state.level.toString();
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
          },
          child: BlocListener<SortCardBloc, SortCardState>(
            listener: (context, state) {
              setState(() {
                _cardQueryParams.sort = state.sortSelected ?? '';
              });
            },
            child: BlocBuilder<AllCardBloc, AllCardState>(
                builder: (context, state) => TmplCardList(
                    typeCard: 'All',
                    allCardState: state,
                    scrollController: _scrollController,
                    title: 'All Cards',
                    onRetryPressed: _fetchCardList)),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _cardListBloc = BlocProvider.of<AllCardBloc>(context);

    _cardQueryParams = CardQueryParams();
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

  Future<void> _fetchCardList() async {
    _cardListBloc.add(InitFetchAllCard());
    await Future.delayed(Duration(milliseconds: 1000));
    _cardListBloc.add(FetchAllCard(params: _cardQueryParams));
  }

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  AllCardBloc _cardListBloc;

  CardQueryParams _cardQueryParams;
}
