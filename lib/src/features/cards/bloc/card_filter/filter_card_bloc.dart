import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../shared/shared.dart';

part 'filter_card_event.dart';

part 'filter_card_state.dart';

class FilterCardBloc
    extends Bloc<FilterCardEvent, FilterCardState> {
  @override
  FilterCardState get initialState => FilterCardState.initial();

  @override
  void onTransition(
      Transition<FilterCardEvent, FilterCardState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<FilterCardState> mapEventToState(
    FilterCardEvent event,
  ) async* {
    if (event is SelectType) {
      yield state.copyWith(cardTypeSelected: event.type);

      if (event.type.contains('Monster')) {
        yield state.copyWith(
          races: raceMonsterStrings,
          attributes: attributeStrings,
          atk: '',
          def: '',
          level: 0,
          attributeSelected: '',
          raceSelected: '',
        );
      }
      if (event.type == 'Spell Card') {
        yield state.copyWith(
          races: raceSpellStrings,
          atk: '-1',
          def: '-1',
          level: -1,
          attributes: [],
          attributeSelected: '',
          raceSelected: '',
        );
      }
      if (event.type == 'Trap Card') {
        yield state.copyWith(
          races: raceTrapStrings,
          atk: '-1',
          def: '-1',
          level: -1,
          attributes: [],
          attributeSelected: '',
          raceSelected: '',
        );
      }
      if (event.type == 'Skill Card') {
        yield state.copyWith(
          races: [],
          atk: '-1',
          def: '-1',
          level: -1,
          attributes: [],
          attributeSelected: '',
          raceSelected: '',
        );
        yield state.copyWith(raceSelected: null);
        yield state.copyWith(attributeSelected: null);
      }
    }
    if (event is SelectRace) {
      yield state.copyWith(raceSelected: event.race);
    }
    if (event is SelectAttribute) {
      yield state.copyWith(attributeSelected: event.attribute);
    }
    if (event is SelectBanList) {
      yield state.copyWith(banListSelected: event.banList);
    }
    if (event is SelectAtk) {
      yield state.copyWith(atk: event.atk);
    }
    if (event is SelectDef) {
      yield state.copyWith(def: event.def);
    }
    if (event is SelectLevel) {
      yield state.copyWith(level: event.level);
    }
    if (event is ResetFilter) {
      yield FilterCardState.initial();
    }
  }
}
