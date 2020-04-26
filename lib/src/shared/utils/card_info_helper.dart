import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/shared/network/base_url.dart';

String cardAttribute(CardListData card) {
  switch (card.type) {
    case "Spell Card":
    case "Skill Card":
    case "Trap Card":
      return card.race;
      break;
    default:
      return card.attribute;
      break;
  }
}

String cardMainIcon(CardListData card) {
  switch (card.type) {
    case "Spell Card":
    case "Skill Card":
    case "Trap Card":
      return cardRaceIcon(card.race);
      break;
    default:
      return '$BASE_URL_IMAGE${card.attribute}.png';
      break;
  }
}

String cardTypeIcon(String type) => '$BASE_URL_CARDTYPE_ICON$type.png';

String cardRaceIcon(String race) => '$BASE_URL_RACE_ICON$race.png';

String cardAttributeIcon(String attribute) => '$BASE_URL_IMAGE$attribute.png';
