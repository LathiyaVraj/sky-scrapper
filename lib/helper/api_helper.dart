import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency_models.dart';

class CurrencyAPIHelpers {
  CurrencyAPIHelpers._();
  static final CurrencyAPIHelpers currencyAPIHelpers = CurrencyAPIHelpers._();

  String from = "USD";
  String to = "INR";
  dynamic value = 1;

  Future<Currency?> featchcurrencydata() async {
    final String API =
        "https://api.exchangerate.host/convert?from=$from&to=$to&amount=$value";

    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedata = jsonDecode(res.body);
      // print("==========================");
      // print(res.body);
      // print("==========================");
      Currency currency = Currency.fromMap(data: decodedata);
      return currency;
    }
  }
}
