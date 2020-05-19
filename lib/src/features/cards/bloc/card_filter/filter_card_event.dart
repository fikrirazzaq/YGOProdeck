part of 'filter_card_bloc.dart';

abstract class FilterCardEvent extends Equatable {
  const FilterCardEvent();

  @override
  List<Object> get props => [];
}

class SelectType extends FilterCardEvent {
  final String type;

  const SelectType({@required this.type});

  @override
  List<Object> get props => [type];

  @override
  String toString() => 'SelectType { type: $type }';
}

class SelectAttribute extends FilterCardEvent {
  final String attribute;

  const SelectAttribute({@required this.attribute});

  @override
  List<Object> get props => [attribute];

  @override
  String toString() => 'SelectAttrubute { attribute: $attribute }';
}

class SelectRace extends FilterCardEvent {
  final String race;

  const SelectRace({@required this.race});

  @override
  List<Object> get props => [race];

  @override
  String toString() => 'SelectRace { race: $race }';
}

class SelectBanList extends FilterCardEvent {
  final String banList;

  const SelectBanList({@required this.banList});

  @override
  List<Object> get props => [banList];

  @override
  String toString() => 'SelectBanList { banList: $banList }';
}

class SelectAtk extends FilterCardEvent {
  final String atk;

  const SelectAtk({@required this.atk});

  @override
  List<Object> get props => [atk];

  @override
  String toString() => 'SelectAtk { banList: $atk }';
}

class SelectDef extends FilterCardEvent {
  final String def;

  const SelectDef({@required this.def});

  @override
  List<Object> get props => [def];

  @override
  String toString() => 'SelectDef { def: $def }';
}

class SelectLevel extends FilterCardEvent {
  final double level;

  const SelectLevel({@required this.level});

  @override
  List<Object> get props => [level];

  @override
  String toString() => 'SelectLevel { def: $level }';
}

class ResetFilter extends FilterCardEvent {
  const ResetFilter();

  @override
  List<Object> get props => [];
}
