import 'dart:convert';

import 'package:coronatracker/constant.dart';
import 'package:coronatracker/models/cases_model.dart';
import 'package:http/http.dart' as http;

class CasesResponse {
  Future<Cases> fetchCases() async {
    try {
      final response = await http.get(
          Uri.parse("https://corona.askbhunte.com/api/v1/data/nepal"),
          headers: {"Accept": "application/json"});
      var results = Cases.fromJson(jsonDecode(response.body));
      return results;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
