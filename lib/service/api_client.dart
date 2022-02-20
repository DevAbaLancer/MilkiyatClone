import 'dart:convert';
import 'dart:developer';

import '../Models/model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Model practice = Model();

  Future<Model> getPostApi() async {
    try {
      final response = await http
          .get(Uri.parse("https://milkiyat.bangalore2.com/api/home/"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        practice = Model.fromJson(data);
      } else {
        log('something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return practice;
  }
}
