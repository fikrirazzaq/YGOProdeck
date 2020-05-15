class CardQueryParams {
  final String type;
  final String attribute;
  final String race;
  final String atk;
  final String def;
  final String sort;
  final String level;
  final String fname;
  final String banlist;

  const CardQueryParams(
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
