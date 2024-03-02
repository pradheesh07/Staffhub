import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:staffhub/Api_Integration/json_convert.dart';

class Api {
  static const _employeeUrl =
      'https://dummy.restapiexample.com/api/v1/employees';

  Future<List<Datum>?> getEmplyoeedetails() async {
    try {
      final response = await http.get(Uri.parse(Api._employeeUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)["data"];
        return decodeData.map((json) => Datum.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load data',
        );
      }
    } catch (error) {
      print(('Error during Api req ;$error'));
    }
  }
}
