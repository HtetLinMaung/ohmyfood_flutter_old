class Ingredient {
  final String id;
  final String name;
  final bool oneOrMore;
  int quantity;

  Ingredient({
    this.id,
    this.name,
    this.oneOrMore,
    this.quantity = 0,
  });
}
