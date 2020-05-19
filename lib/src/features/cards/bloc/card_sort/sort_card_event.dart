part of 'sort_card_bloc.dart';

abstract class SortCardEvent extends Equatable {
  const SortCardEvent();

  @override
  List<Object> get props => [];
}

class SelectSort extends SortCardEvent {
  final String sort;

  const SelectSort({@required this.sort});

  @override
  List<Object> get props => [sort];

  @override
  String toString() => 'SelectSort { def: $sort }';
}

class ResetSort extends SortCardEvent {
  const ResetSort();

  @override
  List<Object> get props => [];
}
