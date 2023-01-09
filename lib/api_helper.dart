import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cases_model.dart';

class CoronaCaseAPIheplers {
  CoronaCaseAPIheplers._();

  static final CoronaCaseAPIheplers coronaCaseAPIheplers =
      CoronaCaseAPIheplers._();

  final String API = "https://disease.sh/v3/covid-19/countries";

  Future<List<Coronacase>?> featchapidata() async {
    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      List decodeCode = jsonDecode(res.body);

      print(decodeCode);

      List<Coronacase> cases =
          decodeCode.map((e) => Coronacase.fromMap(data: e)).toList();

      return cases;
    }
  }
}
