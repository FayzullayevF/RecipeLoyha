class Ingredient {
  final int order;
  final String name;
  final String? amount;

  Ingredient({
    required this.order,
    required this.name,
    required this.amount,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      order: json['order'],
      name: json['name'],
      amount: json['amount'],
    );
  }
}
