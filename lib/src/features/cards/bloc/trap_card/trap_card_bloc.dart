import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../cards.dart';

part 'trap_card_event.dart';

part 'trap_card_state.dart';

class TrapCardBloc extends Bloc<TrapCardEvent, TrapCardState> {
  final CardRepository cardRepository;

  TrapCardBloc({@required this.cardRepository}) : assert(cardRepository != null);

  @override
  TrapCardState get initialState => TrapCardEmpty();

  @override
  Stream<Transition<TrapCardEvent, TrapCardState>> transformEvents(
    Stream<TrapCardEvent> events,
    TransitionFunction<TrapCardEvent, TrapCardState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<TrapCardState> mapEventToState(TrapCardEvent event) async* {
    if (event is InitFetchTrapCard) {
      yield TrapCardEmpty();
    }
    if (event is FetchTrapCard) {
      yield* _mapFetchCardsToState(event);
    }
    if (event is RefreshTrapCard) {
      yield* _mapRefreshCardListToState(event);
    }
  }

  Stream<TrapCardState> _mapFetchCardsToState(FetchTrapCard event) async* {
    final currentState = state;
    if (event is FetchTrapCard && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TrapCardEmpty) {
          final cards =
              await cardRepository.fetchTrapCardList(num: 8, offset: 0);
          yield TrapCardLoaded(cards: cards.data, hasReachedMax: false);
          return;
        }
        if (currentState is TrapCardLoaded) {
          final cards = await cardRepository.fetchTrapCardList(
              num: 8, offset: currentState.cards.length);
          yield cards.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : TrapCardLoaded(
                  cards: currentState.cards + cards.data, hasReachedMax: false);
        }
      } catch (_) {
        yield TrapCardError();
      }
    }
  }

  Stream<TrapCardState> _mapRefreshCardListToState(
      RefreshTrapCard event) async* {
    try {
      final cards = await cardRepository.fetchTrapCardList(num: 8, offset: 0);
      yield TrapCardLoaded(cards: cards.data, hasReachedMax: false);
    } catch (_) {
      yield state;
    }
  }

  bool _hasReachedMax(TrapCardState state) =>
      state is TrapCardLoaded && state.hasReachedMax;
}
