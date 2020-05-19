class CardQueryParams {
  String type;
  String attribute;
  String race;
  String atk;
  String def;
  String sort;
  String level;
  String fname;
  String banlist;

  CardQueryParams(
      {this.type = '',
      this.attribute = '',
      this.race = '',
      this.atk = '',
      this.def = '',
      this.sort = '',
      this.level = '',
      this.fname = '',
      this.banlist = ''});
}
