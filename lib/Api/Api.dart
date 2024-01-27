import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/api_modal.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  String apiKey = "989a4495824248bfbb4d43051fb54cf0";


  Future<List<DataModal>?> fetchedQuote() async {
    String api = "https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      Map decodedData = jsonDecode(data);

      List newsData = decodedData['sources'];

      return newsData
          .map((e) => DataModal(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        url: e['url'],
        category: e['category'],
        language: e['language'],
        country: e['country'],
      ))
          .toList();
    }
    return null;
  }
}
