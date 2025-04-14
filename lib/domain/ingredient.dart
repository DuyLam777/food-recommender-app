class Ingredient {
  final String name;
  final String? category;
  final int? quantity;
  final DateTime? expiryDate;

  Ingredient({
    required this.name,
    this.category,
    this.quantity,
    this.expiryDate,
  });
}
