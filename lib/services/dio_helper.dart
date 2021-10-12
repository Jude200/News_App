import 'package:dio/dio.dart';
import 'package:flutter_flut/core/api.dart';

class DioHelper {
  Dio _dio = Dio();
  DioHelper() {
    _dio = Dio();
  }

  Future<Response<Map<String, dynamic>>> getCategory(category) async {
    String _upcomingUrl = makeCategoryUrl(category);
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_upcomingUrl);
    } on DioError catch (e) {
      print(e.message);
      // if (e.message.contains("SocketException")) {
      //   return null;
      // }
    }
    return _response;
  }

  Future<Response<Map<String, dynamic>>> searchNews(String searchKey) async {
    String _searchUrl = makeSearchUrl(searchKey);
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_searchUrl);
    } on DioError catch (e) {
      print(e.message);
      // if (e.message.contains("SocketException")) {
      //   return null;
      // }
    }
    return _response;
  }

  Future<Response<Map<String, dynamic>>> searchTrending() async {
    String _searchUrl = trendingSearch();
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_searchUrl);
    } on DioError catch (e) {
      print(e.message);
    }
    return _response;
  }
}
