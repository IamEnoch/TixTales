class PriceCategory {
  String? fee;
  String? price;
  String? salesEnd;
  String? ticketType;
  PriceCategory({
    required this.fee,
    required this.price,
    required this.salesEnd,
    required this.ticketType,
  });

  factory PriceCategory.fromMap(Map<String, dynamic> map) {
    return PriceCategory(
      fee: map['fee'],
      price: map['price'],
      salesEnd: map['salesEnd'],
      ticketType: map['tickeType'],
    );
  }
}
