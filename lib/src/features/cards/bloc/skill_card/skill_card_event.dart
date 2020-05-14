part of 'skill_card_bloc.dart';

abstract class SkillCardEvent extends Equatable {
  const SkillCardEvent();
}

class InitFetchSkillCard extends SkillCardEvent {
  @override
  List<Object> get props => [];
}

class FetchSkillCard extends SkillCardEvent {
  @override
  List<Object> get props => [];
}

class RefreshSkillCard extends SkillCardEvent {
  @override
  List<Object> get props => [];
}
