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
        AppBar(title: AtmTextHeading4(text: widget.title)),
        Expanded(child: buildBody(widget.typeCard)),
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
    print("All Card");
    if (state is AllCardLoaded) {
      if (state.cards.isEmpty) return Center(child: Text('No cards found.'));

      return OrgCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is AllCardError)
      return MolLoadFailed(onRetryPressed: widget.onRetryPressed);

    return Center(child: AtmPrimaryLoading());
  }

  Widget buildTrapCardBody(TrapCardState state) {
    print("Trap Card");

    if (state is TrapCardLoaded) {
      if (state.cards.isEmpty) return Center(child: Text('No cards found.'));

      return OrgCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is TrapCardError)
      return MolLoadFailed(onRetryPressed: widget.onRetryPressed);

    return Center(child: AtmPrimaryLoading());
  }

  Widget buildSkillCardBody(SkillCardState state) {
    print("Skill Card");

    if (state is SkillCardLoaded) {
      if (state.cards.isEmpty) return Center(child: Text('No cards found.'));

      return OrgCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is SkillCardError)
      return MolLoadFailed(onRetryPressed: widget.onRetryPressed);

    return Center(child: AtmPrimaryLoading());
  }

  Widget buildSpellCardBody(SpellCardState state) {
    print("Spell Card");

    if (state is SpellCardLoaded) {
      if (state.cards.isEmpty) return Center(child: Text('No cards found.'));

      return OrgCardList(
          cards: state.cards,
          hasReachedMax: state.hasReachedMax,
          scrollController: widget.scrollController);
    }

    if (state is SpellCardError)
      return MolLoadFailed(onRetryPressed: widget.onRetryPressed);

    return Center(child: AtmPrimaryLoading());
  }
}
