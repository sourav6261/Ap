import 'dart:convert';

import 'package:ap_enterprises/model/loginmodel/loginmodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'https://server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com/apEnterprisesLogin');
    var response = await http.post(url, body: param);
    print("Response:${response.statusCode}");
    print("Response body:${response.body}");
    final data = await jsonDecode(jsonEncode(response.body));
    return LoginApiResponse(
      token: data["sourav"] as String,
      error: data["error"] as String,
    );
  }
}
