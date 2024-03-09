import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiServices {
  getApiCall({
    required String apiUrl,
  }) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return response.body.toString();
      } else {
        return false;
      }
    } catch (e, stackTrace) {
      log("api call error $e", stackTrace: stackTrace);
    }
  }
}
