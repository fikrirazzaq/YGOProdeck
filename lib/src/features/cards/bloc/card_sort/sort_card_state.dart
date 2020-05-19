part of 'sort_card_bloc.dart';

class SortCardState extends Equatable {
  final List<String> sortList;
  final String sortSelected;

  const SortCardState({this.sortSelected, this.sortList});

  factory SortCardState.initial() {
    return SortCardState(
      sortList: sortStrings,
      sortSelected: null,
    );
  }

  SortCardState copyWith({String sortSelected, List<String> sortList}) {
    return SortCardState(
        sortSelected: sortSelected ?? this.sortSelected,
        sortList: sortList ?? this.sortList);
  }

  @override
  List<Object> get props => [sortSelected, sortList];

  @override
  String toString() {
    return '''SortCardState {
      sortSelected: $sortSelected,
      sortList: $sortList,
    }''';
  }
}
