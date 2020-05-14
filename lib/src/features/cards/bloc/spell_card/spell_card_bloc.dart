import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../cards.dart';

part 'spell_card_event.dart';

part 'spell_card_state.dart';

class SpellCardBloc extends Bloc<SpellCardEvent, SpellCardState> {
  final CardRepository cardRepository;

  SpellCardBloc({@required this.cardRepository})
      : assert(cardRepository != null);

  @override
  SpellCardState get initialState => SpellCardEmpty();

  @override
  Stream<Transition<SpellCardEvent, SpellCardState>> transformEvents(
    Stream<SpellCardEvent> events,
    TransitionFunction<SpellCardEvent, SpellCardState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<SpellCardState> mapEventToState(SpellCardEvent event) async* {
    if (event is InitFetchSpellCard) {
      yield SpellCardEmpty();
    }
    if (event is FetchSpellCard) {
      yield* _mapFetchSpellCardToState(event);
    }
    if (event is RefreshSpellCard) {
      yield* _mapRefreshSpellCardToState(event);
    }
  }

  Stream<SpellCardState> _mapFetchSpellCardToState(
      FetchSpellCard event) async* {
    final currentState = state;
    if (event is FetchSpellCard && !_hasReachedMax(currentState)) {
      try {
        if (currentState is SpellCardEmpty) {
          final cards =
              await cardRepository.fetchSpellCardList(num: 8, offset: 0);
          yield SpellCardLoaded(cards: cards.data, hasReachedMax: false);
          return;
        }
        if (currentState is SpellCardLoaded) {
          final cards = await cardRepository.fetchSpellCardList(
              num: 8, offset: currentState.cards.length);
          yield cards.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SpellCardLoaded(
                  cards: currentState.cards + cards.data, hasReachedMax: false);
        }
      } catch (_) {
        yield SpellCardError();
      }
    }
  }

  Stream<SpellCardState> _mapRefreshSpellCardToState(
      RefreshSpellCard event) async* {
    try {
      final cards = await cardRepository.fetchSpellCardList(num: 8, offset: 0);
      yield SpellCardLoaded(cards: cards.data, hasReachedMax: false);
    } catch (_) {
      yield state;
    }
  }

  bool _hasReachedMax(SpellCardState state) =>
      state is SpellCardLoaded && state.hasReachedMax;
}
