import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newapp/model/newsmodel.dart';

class Service {
  String baseUrl = "https://inshortsapi.vercel.app/news?category";

  Future<NewFeedModel> getData() async {
    final res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body);
      NewFeedModel newFeedModel = NewFeedModel.fromJson(jsonData);
      return newFeedModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
