import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../cards.dart';

part 'skill_card_event.dart';

part 'skill_card_state.dart';

class SkillCardBloc extends Bloc<SkillCardEvent, SkillCardState> {
  final CardRepository cardRepository;

  SkillCardBloc({@required this.cardRepository})
      : assert(cardRepository != null);

  @override
  SkillCardState get initialState => SkillCardEmpty();

  @override
  Stream<Transition<SkillCardEvent, SkillCardState>> transformEvents(
    Stream<SkillCardEvent> events,
    TransitionFunction<SkillCardEvent, SkillCardState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<SkillCardState> mapEventToState(SkillCardEvent event) async* {
    if (event is InitFetchSkillCard) {
      yield SkillCardEmpty();
    }
    if (event is FetchSkillCard) {
      yield* _mapFetchSpellCardToState(event);
    }
    if (event is RefreshSkillCard) {
      yield* _mapRefreshSpellCardToState(event);
    }
  }

  Stream<SkillCardState> _mapFetchSpellCardToState(
      FetchSkillCard event) async* {
    final currentState = state;
    if (event is FetchSkillCard && !_hasReachedMax(currentState)) {
      try {
        if (currentState is SkillCardEmpty) {
          final cards =
              await cardRepository.fetchSkillCardList(num: 8, offset: 0);
          yield SkillCardLoaded(cards: cards.data, hasReachedMax: false);
          return;
        }
        if (currentState is SkillCardLoaded) {
          final cards = await cardRepository.fetchSkillCardList(
              num: 8, offset: currentState.cards.length);
          yield cards.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SkillCardLoaded(
                  cards: currentState.cards + cards.data, hasReachedMax: false);
        }
      } catch (_) {
        yield SkillCardError();
      }
    }
  }

  Stream<SkillCardState> _mapRefreshSpellCardToState(
      RefreshSkillCard event) async* {
    try {
      final cards = await cardRepository.fetchSkillCardList(num: 8, offset: 0);
      yield SkillCardLoaded(cards: cards.data, hasReachedMax: false);
    } catch (_) {
      yield state;
    }
  }

  bool _hasReachedMax(SkillCardState state) =>
      state is SkillCardLoaded && state.hasReachedMax;
}
