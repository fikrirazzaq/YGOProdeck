import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'card_list_event.dart';

part 'card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  final CardRepository cardRepository;

  CardListBloc({@required this.cardRepository})
      : assert(cardRepository != null);

  @override
  CardListState get initialState => CardListEmpty();

  @override
  Stream<Transition<CardListEvent, CardListState>> transformEvents(
    Stream<CardListEvent> events,
    TransitionFunction<CardListEvent, CardListState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CardListState> mapEventToState(CardListEvent event) async* {
    if (event is FetchCardList) {
      yield* _mapFetchCardsToState(event);
    }
  }

  Stream<CardListState> _mapFetchCardsToState(FetchCardList event) async* {
    final currentState = state;
    if (event is FetchCardList && !_hasReachedMax(currentState)) {
      try {
        if (currentState is CardListEmpty) {
          final cards = await cardRepository.fetchCardList(num: 10, offset: 0);
          yield CardListLoaded(cards: cards.data, hasReachedMax: false);
          return;
        }
        if (currentState is CardListLoaded) {
          final cards = await cardRepository.fetchCardList(
              offset: currentState.cards.length, num: 20);
          print("CARDS: ${cards.data.length}");
          yield cards.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : CardListLoaded(
                  cards: currentState.cards + cards.data, hasReachedMax: false);
        }
      } catch (_) {
        yield CardListError();
      }
    }
  }

  bool _hasReachedMax(CardListState state) =>
      state is CardListLoaded && state.hasReachedMax;
}
