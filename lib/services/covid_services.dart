import 'dart:convert';

import 'package:covid_app/models/covid.dart';
import 'package:covid_app/utilities/api_url.dart';
import 'package:http/http.dart' as http;

class CovidServices {
  Future<List<Covid>?> getAllCountriesData() async {
    final response = await http.get(Uri.parse(ApiUrl.countriesData));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Covid> covidList = data
          .map(
            (e) => Covid.fromJson(e),
          )
          .toList();
      return covidList;
    } else {
      throw Exception("Error");
    }
  }
}
