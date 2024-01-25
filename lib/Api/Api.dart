import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:exam_1/modal/api_modal.dart';


class Apihelper {
  Apihelper._();

  static final Apihelper apiHelper = Apihelper._();

  Future<List<DataModal>?> fetchedPhotos([String searchedText = ""]) async {
    String api = "https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      Map decodedData = jsonDecode(data);
      List news = decodedData['sources'];

      // News news = News.fromJson(decodedData);

      return news
          .map(
            (e) => DataModal(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          url: e['url'],
          category: e['category'],
          language: e['language'],
          country: e['country'],
        ),
      )
          .toList();
    }
    return null;
  }
}
