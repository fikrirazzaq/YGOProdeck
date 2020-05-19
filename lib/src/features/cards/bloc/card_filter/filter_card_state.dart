part of 'filter_card_bloc.dart';

class FilterCardState extends Equatable {
  final List<String> cardTypes;
  final List<String> races;
  final List<String> attributes;
  final List<String> banList;

  final String cardTypeSelected;
  final String raceSelected;
  final String attributeSelected;
  final String banListSelected;

  final String atk;
  final String def;
  final double level;

  const FilterCardState({
    this.cardTypes,
    this.races,
    this.attributes,
    this.banList,
    this.cardTypeSelected,
    this.raceSelected,
    this.attributeSelected,
    this.banListSelected,
    this.atk,
    this.def,
    this.level,
  });

  factory FilterCardState.initial() {
    return FilterCardState(
      cardTypes: cardTypeStrings,
      races: raceMonsterStrings,
      attributes: attributeStrings,
      banList: banListStrings,
      atk: null,
      def: null,
      level: 0,
      attributeSelected: null,
      banListSelected: null,
      cardTypeSelected: null,
      raceSelected: null,
    );
  }

  FilterCardState copyWith({
    List<String> cardTypes,
    List<String> races,
    List<String> attributes,
    List<String> banlist,
    String cardTypeSelected,
    String raceSelected,
    String attributeSelected,
    String banListSelected,
    String atk,
    String def,
    double level,
  }) {
    return FilterCardState(
        cardTypes: cardTypes ?? this.cardTypes,
        races: races ?? this.races,
        attributes: attributes ?? this.attributes,
        banList: banlist ?? this.banList,
        cardTypeSelected: cardTypeSelected ?? this.cardTypeSelected,
        raceSelected: raceSelected ?? this.attributeSelected,
        attributeSelected: attributeSelected ?? this.attributeSelected,
        banListSelected: banListSelected ?? this.banListSelected,
        atk: atk ?? this.atk,
        def: def ?? this.def,
        level: level ?? this.level);
  }

  @override
  List<Object> get props => [
        cardTypes,
        attributes,
        races,
        banList,
        attributeSelected,
        cardTypeSelected,
        raceSelected,
        banListSelected,
        atk,
        def,
        level,
      ];

  @override
  String toString() {
    return '''FilterCardState {
      attributeSelected: $attributeSelected,
      cardTypeSelected: $cardTypeSelected,
      raceSelected: $raceSelected,
      banListSelected: $banListSelected,
      atk: $atk,
      def: $def,
      level: $level,
      }''';
  }
}
