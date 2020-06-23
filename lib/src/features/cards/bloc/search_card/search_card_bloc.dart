import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_card_event.dart';

part 'search_card_state.dart';

class SearchCardBloc extends Bloc<SearchCardEvent, SearchCardState> {
  final CardRepository cardRepository;

  SearchCardBloc({@required this.cardRepository})
      : assert(cardRepository != null);

  @override
  SearchCardState get initialState => SearchCardEmpty();

  @override
  void onTransition(Transition<SearchCardEvent, SearchCardState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<Transition<SearchCardEvent, SearchCardState>> transformEvents(
    Stream<SearchCardEvent> events,
    TransitionFunction<SearchCardEvent, SearchCardState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<SearchCardState> mapEventToState(SearchCardEvent event) async* {
    print("EVENT: $event");
    if (event is InitFetchSearchCard) {
      print("INITFETCH ALL");
      yield SearchCardEmpty();
    }
    if (event is FetchSearchCard) {
      print("FETCH ALL");
      yield* _mapFetchCardsToState(event);
    }
  }

  Stream<SearchCardState> _mapFetchCardsToState(FetchSearchCard event) async* {
    final currentState = state;
    if (!_hasReachedMax(state)) {
      try {
        if (currentState is SearchCardEmpty) {
          final cards = await cardRepository.fetchSearchCardList(
              keyword: event.keyword, num: 10, offset: 0);
          yield SearchCardLoaded(cards: cards.data, hasReachedMax: false);
          return;
        }
        if (currentState is SearchCardLoaded) {
          final cards = await cardRepository.fetchSearchCardList(
              keyword: event.keyword,
              num: 10,
              offset: currentState.cards.length);
          yield cards.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SearchCardLoaded(cards: cards.data, hasReachedMax: true);
        }
      } catch (_) {
        yield SearchCardError();
      }
    }
  }

  bool _hasReachedMax(SearchCardState state) =>
      state is SearchCardLoaded && state.hasReachedMax;
}
