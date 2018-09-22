import 'dart:async';

import 'package:dio/dio.dart';
import 'package:scifiworld/models/apiResponse.dart';
import 'package:scifiworld/models/movie/scifiMovieResult.dart';
import 'package:scifiworld/config/appConfiguration.dart';

class MovieService {
  static final MovieService _authService = new MovieService._internal();
  Dio dio = new Dio();
  bool didInit = false;

  static MovieService get() {
    return _authService;
  }

  MovieService._internal();

  Future _init() async {
    didInit = true;
  }

  Future init() async {
    return await _init();
  }

  Future<List<ScifiMovieResult>> fetchScifiMovie(int page) async {
    String url = AppConfiguration.BASE_API_URL +
        "discover/movie?api_key=" +
        AppConfiguration.API_KEY +
        "&sort_by=popularity.desc&page=$page&with_genres=878";
    var response = await dio.get(url);
    if(response.statusCode == 200){
       ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      List<ScifiMovieResult> scifiMovieList = _createScifiMoviesList(apiResponse);
      return scifiMovieList;
    } else {
      throw Exception('Cannot get movies list at this time!');
    }
  }
  // Future<FrontPageVM> fetchFrontPageData() async {
  //   String url = AppConfiguration.BASE_API_URL + "front";
  //   FrontPageVM pageVM = new FrontPageVM();

  //   var response = await dio.get(url);
  //   if (response.statusCode == 200) {
  //     ApiResponse apiResponse = ApiResponse.fromJson(response.data);
  //     pageVM = FrontPageVM.fromJson(apiResponse.result);
  //     return pageVM;
  //   } else {
  //     throw Exception('Cannot get Front Page data at this time!');
  //   }
  // }

  // Future<List<News>> fetchNewsList(int page) async {
  //   String url = AppConfiguration.BASE_API_URL + "news?page=$page";
  //   var response = await dio.get(url);
  //   if (response.statusCode == 200) {
  //     ApiResponse apiResponse = ApiResponse.fromJson(response.data);
  //     List<News> newsList = _createnewsList(apiResponse);
  //     return newsList;
  //   } else {
  //     throw Exception('Cannot get news list at this time!');
  //   }
  // }

  List<ScifiMovieResult> _createScifiMoviesList(ApiResponse data) {
    List<ScifiMovieResult> news = new List();
    for (int i = 0; i < data.results.length; i++) {
      var temp = ScifiMovieResult.fromJson((data.results[i]));
      news.add(temp);
    }
    return news;
  }

}
