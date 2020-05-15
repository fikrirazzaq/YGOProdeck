part of 'filter_sort_card_bloc.dart';

class FilterSortCardState extends Equatable {
  final List<String> cardTypes;
  final List<String> races;
  final List<String> attributes;
  final List<String> banList;
  final List<String> sortList;

  final String cardTypeSelected;
  final String raceSelected;
  final String attributeSelected;
  final String banListSelected;

  final String atk;
  final String def;
  final double level;

  final String sortSelected;

  const FilterSortCardState({
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
    this.sortSelected,
    this.sortList,
  });

  factory FilterSortCardState.initial() {
    return FilterSortCardState(
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
      sortList: sortStrings,
      sortSelected: null,
    );
  }

  FilterSortCardState copyWith({
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
    String sortSelected,
    List<String> sortList,
  }) {
    return FilterSortCardState(
        cardTypes: cardTypes ?? this.cardTypes,
        races: races ?? this.races,
        attributes: attributes ?? this.attributes,
        banList: banlist ?? this.banList,
        cardTypeSelected: cardTypeSelected ?? this.cardTypeSelected,
        raceSelected: raceSelected ?? this.raceSelected,
        attributeSelected: attributeSelected ?? this.attributeSelected,
        banListSelected: banListSelected ?? this.banListSelected,
        atk: atk ?? this.atk,
        def: def ?? this.def,
        level: level ?? this.level,
        sortSelected: sortSelected ?? this.sortSelected,
        sortList: sortList ?? this.sortList);
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
        sortSelected,
        sortList,
      ];

  @override
  String toString() {
    return '''FilterSortCardState {
      cardTypes: $cardTypes,
      attributes: $attributes,
      races: $races,
      banList: $banList,
      attributeSelected: $attributeSelected,
      cardTypeSelected: $cardTypeSelected,
      raceSelected: $raceSelected,
      banListSelected: $banListSelected,
      atk: $atk,
      def: $def,
      level: $level,
      sortSelected: $sortSelected,
      sortList: $sortList,
    }''';
  }
}
