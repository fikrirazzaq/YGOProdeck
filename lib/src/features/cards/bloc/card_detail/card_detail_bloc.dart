import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../cards.dart';

part 'card_detail_event.dart';

part 'card_detail_state.dart';

class CardDetailBloc extends Bloc<CardDetailEvent, CardDetailState> {
  final CardRepository cardRepository;

  CardDetailBloc({@required this.cardRepository})
      : assert(cardRepository != null);

  @override
  CardDetailState get initialState => CardDetailEmpty();

  @override
  Stream<CardDetailState> mapEventToState(CardDetailEvent event) async* {
    if (event is InitFetchCard) {
      yield CardDetailEmpty();
    }
    if (event is FetchCardDetail) {
      yield* _mapFetchCardDetailToState(event);
    }
    if (event is RefreshCardDetail) {
      yield* _mapRefreshCardDetailToState(event);
    }
  }

  Stream<CardDetailState> _mapFetchCardDetailToState(
      FetchCardDetail event) async* {
    try {
      final CardDetailResponse card =
          await cardRepository.fetchCardDetail(cardName: event.cardName);
      yield CardDetailLoaded(card: card.data.first);
    } catch (_) {
      yield CardDetailError();
    }
  }

  Stream<CardDetailState> _mapRefreshCardDetailToState(
      RefreshCardDetail event) async* {
    try {
      final CardDetailResponse card =
          await cardRepository.fetchCardDetail(cardName: event.cardName);
      yield CardDetailLoaded(card: card.data.first);
    } catch (_) {
      yield state;
    }
  }
}
