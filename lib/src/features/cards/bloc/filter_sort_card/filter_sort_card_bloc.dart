import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../shared/shared.dart';

part 'filter_sort_card_event.dart';

part 'filter_sort_card_state.dart';

class FilterSortCardBloc
    extends Bloc<FilterSortCardEvent, FilterSortCardState> {
  @override
  FilterSortCardState get initialState => FilterSortCardState.initial();

  @override
  void onTransition(
      Transition<FilterSortCardEvent, FilterSortCardState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<FilterSortCardState> mapEventToState(
    FilterSortCardEvent event,
  ) async* {
    if (event is SelectType) {
      yield state.copyWith(
          cardTypeSelected: event.type,
          raceSelected: null,
          attributeSelected: null);

      if (event.type.contains('Monster')) {
        yield state.copyWith(
            races: raceMonsterStrings, attributes: attributeStrings);
      }
      if (event.type == 'Spell Card') {
        yield state.copyWith(
          races: raceSpellStrings,
          attributeSelected: null,
          raceSelected: null,
          atk: null,
          def: null,
          level: null,
          attributes: [],
        );
      }
      if (event.type == 'Trap Card') {
        yield state.copyWith(
          races: raceTrapStrings,
          attributeSelected: null,
          raceSelected: null,
          atk: null,
          def: null,
          level: null,
          attributes: [],
        );
      }
      if (event.type == 'Skill Card') {
        yield state.copyWith(
          races: [],
          attributeSelected: null,
          raceSelected: null,
          atk: null,
          def: null,
          level: null,
          attributes: [],
        );
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
    if (event is SelectSort) {
      yield state.copyWith(sortSelected: event.sort);
    }
    if (event is ResetFilterSort) {
      yield FilterSortCardState.initial();
    }
  }
}
