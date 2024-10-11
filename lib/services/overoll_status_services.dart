import 'dart:convert';

import 'package:covid_app/models/overoll_status.dart';
import 'package:covid_app/utilities/api_url.dart';
import 'package:http/http.dart' as http;

class OverollStatusServices {
  Future<OverollStatus?> getOverollStatus() async {
    final response = await http.get(Uri.parse(ApiUrl.allCountries));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return OverollStatus.fromJson(data);
    } else {
      throw Exception("Error Catched While Fetching Data ");
    }
  }
}
