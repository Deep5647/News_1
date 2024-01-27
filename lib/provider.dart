import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/Api.dart';

class ServiceData extends ChangeNotifier{

  Set<String> favoriteQuotes = {};


  late InAppWebViewController _webViewController;
  TextEditingController searchController = TextEditingController();

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteQuotes = Set.from(prefs.getStringList('favorites') ?? []);
  }

  Future<void> getData() async {
    await APIHelper.apiHelper.fetchedQuote().then((value) {});
  }


  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', favoriteQuotes.toList());
  }

  void addToFavorites(String quoteId) {
    favoriteQuotes.add(quoteId);
    saveFavorites();
    notifyListeners();
  }

  void removeFromFavorites(String quoteId) {
    favoriteQuotes.remove(quoteId);
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(String quoteId) {
    return favoriteQuotes.contains(quoteId);
  }




  void setWebViewController(InAppWebViewController controller){
    _webViewController = controller;

  }

  void reloadWebView() {
    if (_webViewController != null) {
      _webViewController.reload();
    }
  }
  void goBack() {
    if (_webViewController != null) {
      _webViewController.goBack();
    }
  }

  void goHome(String url) {
    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: WebUri(url),
      ),
    );
  }



  void goForward() {
    if (_webViewController != null) {
      _webViewController.goForward();
    }
  }





}