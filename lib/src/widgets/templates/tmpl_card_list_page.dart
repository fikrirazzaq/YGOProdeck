import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../widgets.dart';

class TmplCardList extends StatefulWidget {
  final ScrollController scrollController;
  final String typeCard;
  final AllCardState allCardState;
  final SpellCardState spellCardState;
  final SkillCardState skillCardState;
  final TrapCardState trapCardState;
  final String title;
  final Function onRetryPressed;

  const TmplCardList(
      {Key key,
      this.scrollController,
      this.title,
      this.onRetryPressed,
      this.allCardState,
      this.spellCardState,
      this.skillCardState,
      this.trapCardState,
      this.typeCard})
      : super(key: key);

  @override
  _TmplCardListState createState() => _TmplCardListState();
}

class _TmplCardListState extends State<TmplCardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
            backgroundColor: Colors.white,
            title: AtmTextHeading4(text: widget.title)),
        Expanded(
            child: Stack(
          children: [
            buildBody(widget.typeCard),
            buildFilterButton(context),
          ],
        )),
      ],
    );
  }

  Widget buildBody(String type) {
    if (isAllCard(type)) return buildAllCardBody(widget.allCardState);
    if (isTrapCard(type)) return buildTrapCardBody(widget.trapCardState);
    if (isSpellCard(type)) return buildSpellCardBody(widget.spellCardState);
    if (isSkillCard(type)) return buildSkillCardBody(widget.skillCardState);
  }

  Widget buildAllCardBody(AllCardState state) {
    print("STATTE: $state");
    if (state is AllCardLoaded) {
      if (state.cards.isEmpty) return Center(child: Text('No cards found.'));

      return OrgCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is AllCardError) return _buildError();

    return _buildLoading();
  }

  Widget buildTrapCardBody(TrapCardState state) {
    if (state is TrapCardLoaded) {
      if (state.cards.isEmpty) return _buildEmptyCardList();

      return _buildFilledCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is TrapCardError) return _buildError();

    return _buildLoading();
  }

  Widget buildSkillCardBody(SkillCardState state) {
    if (state is SkillCardLoaded) {
      if (state.cards.isEmpty) return _buildEmptyCardList();

      return _buildFilledCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is SkillCardError) return _buildError();

    return _buildLoading();
  }

  Widget buildSpellCardBody(SpellCardState state) {
    if (state is SpellCardLoaded) {
      if (state.cards.isEmpty) return _buildEmptyCardList();

      return _buildFilledCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is SpellCardError) return _buildError();

    return _buildLoading();
  }

  Widget _buildFilledCardList({
    List<CardListData> cards,
    bool hasReachedMax,
    ScrollController scrollController,
  }) {
    return OrgCardList(
        cards: cards,
        hasReachedMax: hasReachedMax,
        scrollController: scrollController);
  }

  Widget _buildEmptyCardList() => Center(child: Text('No cards found.'));

  Widget _buildError() => MolLoadFailed(onRetryPressed: widget.onRetryPressed);

  Widget _buildLoading() => Center(child: AtmPrimaryLoading());

  Widget buildFilterButton(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: MolFilterFloatingButton(
        onFilterPressed: () {
          ShowBottomSheet.filterCards(context);
        },
        onSortPressed: () {
          ShowBottomSheet.sortCards(context);
        },
      ),
    );
  }
}
