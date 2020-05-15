part of 'filter_sort_card_bloc.dart';

abstract class FilterSortCardEvent extends Equatable {
  const FilterSortCardEvent();

  @override
  List<Object> get props => [];
}

class SelectType extends FilterSortCardEvent {
  final String type;

  const SelectType({@required this.type});

  @override
  List<Object> get props => [type];

  @override
  String toString() => 'SelectType { type: $type }';
}

class SelectAttribute extends FilterSortCardEvent {
  final String attribute;

  const SelectAttribute({@required this.attribute});

  @override
  List<Object> get props => [attribute];

  @override
  String toString() => 'SelectAttrubute { attribute: $attribute }';
}

class SelectRace extends FilterSortCardEvent {
  final String race;

  const SelectRace({@required this.race});

  @override
  List<Object> get props => [race];

  @override
  String toString() => 'SelectRace { race: $race }';
}

class SelectBanList extends FilterSortCardEvent {
  final String banList;

  const SelectBanList({@required this.banList});

  @override
  List<Object> get props => [banList];

  @override
  String toString() => 'SelectBanList { banList: $banList }';
}

class SelectAtk extends FilterSortCardEvent {
  final String atk;

  const SelectAtk({@required this.atk});

  @override
  List<Object> get props => [atk];

  @override
  String toString() => 'SelectAtk { banList: $atk }';
}

class SelectDef extends FilterSortCardEvent {
  final String def;

  const SelectDef({@required this.def});

  @override
  List<Object> get props => [def];

  @override
  String toString() => 'SelectDef { def: $def }';
}

class SelectLevel extends FilterSortCardEvent {
  final double level;

  const SelectLevel({@required this.level});

  @override
  List<Object> get props => [level];

  @override
  String toString() => 'SelectLevel { def: $level }';
}

class SelectSort extends FilterSortCardEvent {
  final String sort;

  const SelectSort({@required this.sort});

  @override
  List<Object> get props => [sort];

  @override
  String toString() => 'SelectSort { def: $sort }';
}

class ResetFilterSort extends FilterSortCardEvent {
  const ResetFilterSort();

  @override
  List<Object> get props => [];
}
