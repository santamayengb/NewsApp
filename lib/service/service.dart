import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:newapp/model/newsmodel.dart';

class Service {
  String baseUrl = "https://inshortsapi.vercel.app/news?category=";

  Future<NewFeedModel> getData(String categoryName) async {
    log(categoryName);
    try {
      final res = await http.get(Uri.parse(baseUrl + categoryName));
      final jsonData = json.decode(res.body) as Map<String, dynamic>;
      final newFeedModel = NewFeedModel.fromJson(jsonData);
      return newFeedModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
