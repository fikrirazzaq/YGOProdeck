import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:bloc/bloc.dart';
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
  Stream<CardListState> mapEventToState(CardListEvent event) async* {
    if (event is FetchCardList) {
      yield* _mapFetchCardsToState(event);
    }
  }

  Stream<CardListState> _mapFetchCardsToState(FetchCardList event) async* {
    yield CardListLoading();
    try {
      final CardListResponse cards = await cardRepository.fetchCardList();
      yield CardListLoaded(cards: cards);
    } catch (_) {
      yield CardListError();
    }
  }
}
