import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skyscrapper3/people_model.dart';

class RandomAPIhelpler {
  RandomAPIhelpler._();
  static final RandomAPIhelpler randomAPIhelpler = RandomAPIhelpler._();

  final String API = "https://randomuser.me/api/";

  Future<Random?> featchAPIData() async {
    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedata = jsonDecode(res.body);
      Random random = Random.fromMap(data: decodedata);
      return random;
    }
  }
}
