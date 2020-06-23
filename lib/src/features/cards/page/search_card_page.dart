import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../../cards/cards.dart';

class SearchCardPage extends StatefulWidget {
  @override
  _SearchCardPageState createState() => _SearchCardPageState();
}

class _SearchCardPageState extends State<SearchCardPage> {
  SearchCardBloc _searchCardBloc;

  String keyword = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _searchCardBloc = BlocProvider.of<SearchCardBloc>(context);
    _searchCardBloc.add(InitFetchSearchCard());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                hintText: 'Search card keyword...'),
            onChanged: (keyword) async {
              setState(() {
                this.keyword = keyword;
              });
              if (keyword.length >= 3) {
                Future.delayed(Duration(milliseconds: 800)).then((value) async {
                  _searchCardBloc.add(InitFetchSearchCard());
                  await Future.delayed(Duration(milliseconds: 1000));
                  _searchCardBloc.add(FetchSearchCard(keyword: keyword));
                });
              }
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<SearchCardBloc, SearchCardState>(
            builder: (context, state) {
          if (state is SearchCardEmpty) {
            return Center(
              child: MolEmptyLayout(
                icon: Icons.find_in_page,
                desc: Text(
                  "Search card",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            );
          }
          if (state is SearchCardLoaded) {
            return OrgCardList(
              cards: state.cards,
              hasReachedMax: state.hasReachedMax,
              scrollController: _scrollController,
            );
          }
          if (state is SearchCardError) {
            return Center(child: MolLoadFailed());
          }
          return Center(child: AtmPrimaryLoading());
        }),
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) _fetchSearchCardList();
  }

  Future<void> _fetchSearchCardList() async {
    _searchCardBloc.add(FetchSearchCard(keyword: keyword));
  }

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
}
