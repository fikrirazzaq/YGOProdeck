import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:flutter/material.dart';

String cardTypeIcon(String type) => '$BASE_URL_CARDTYPE_ICON$type.png';

String cardRaceIcon(String race) => '$BASE_URL_RACE_ICON$race.png';

String cardAttributeIcon(String attribute) => '$BASE_URL_IMAGE$attribute.jpg';

Color cardColor(CardListData card) {
  if (card.type.toLowerCase().contains('monster')) {
    switch (card.attribute.toLowerCase()) {
      case 'dark':
        return dark;
        break;
      case 'earth':
        return earth;
        break;
      case 'fire':
        return fire;
        break;
      case 'light':
        return light;
        break;
      case 'water':
        return water;
        break;
      case 'wind':
        return wind;
        break;
      case 'divine':
        return divine;
        break;
    }
  }

  if (card.type.toLowerCase().contains('trap')) return trap;

  if (card.type.toLowerCase().contains('skill')) return skill;

  if (card.type.toLowerCase().contains('spell')) return spell;
}

String atkDefList(CardListData card) => "ATK/${card.atk} DEF/${card.def}";

String atkDefDetail(CardDetailData card) => "ATK/${card.atk} DEF/${card.def}";

bool isSkillCard(String menu) => menu == 'Skill';

bool isTrapCard(String menu) => menu == 'Trap';

bool isSpellCard(String menu) => menu == 'Spell';

bool isAllCard(String menu) => menu == 'All';
