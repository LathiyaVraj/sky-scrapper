class Currency {
  final num rate;
  final num result;

  Currency({
    required this.rate,
    required this.result,
  });

  factory Currency.fromMap({required Map<String, dynamic> data}) {
    return Currency(rate: data["info"]["rate"], result: data["result"]);
  }
}
