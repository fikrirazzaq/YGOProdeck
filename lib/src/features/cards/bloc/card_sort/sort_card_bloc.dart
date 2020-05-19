import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../shared/shared.dart';

part 'sort_card_event.dart';

part 'sort_card_state.dart';

class SortCardBloc
    extends Bloc<SortCardEvent, SortCardState> {
  @override
  SortCardState get initialState => SortCardState.initial();

  @override
  void onTransition(
      Transition<SortCardEvent, SortCardState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<SortCardState> mapEventToState(
    SortCardEvent event,
  ) async* {
    if (event is SelectSort) {
      yield state.copyWith(sortSelected: event.sort);
    }
    if (event is ResetSort) {
      yield SortCardState.initial();
    }
  }
}
