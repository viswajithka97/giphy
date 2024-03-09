import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:giphy/core/api_key.dart';
import 'package:giphy/core/api_services.dart';

import '../../trending_section/models/trending_data_model.dart';
import '../models/home_page_data_model.dart';

class HomeController extends GetxController {
  List<HomePageDataModel> homeModel = [];
  List<TrendingDataModel> trendingDataModel = [];
  List<TrendingDataModel> searchModel = [];
  bool isLoading = true;
  bool isPaginationActive = false;

  int pageCount = 17;

  // get home page data api call
  Future getHomePage([bool isPagination = false]) async {
    if (isPagination) {
      isPaginationActive = true;
      update(["pagination"]);
      pageCount = pageCount + 5;
    } else {
      isLoading = true;
      update(["home_page"]);
    }
    String url =
        "https://api.giphy.com/v1/stickers/trending?api_key=$api_key&limit=$pageCount&offset=0&rating=g&bundle=messaging_non_clips";

    try {
      final response = await ApiServices().getApiCall(apiUrl: url);

      if (response != null) {
        // log(response.toString());

        final jsonMap = json.decode(response);
        if (isPaginationActive) {
          homeModel.addAll(List<HomePageDataModel>.from(
            jsonMap["data"].map(
              (x) => HomePageDataModel.fromMap(x),
            ),
          ));
          isPaginationActive = false;
          update(["pagination"]);
        } else {
          homeModel = List<HomePageDataModel>.from(
            jsonMap["data"].map(
              (x) => HomePageDataModel.fromMap(x),
            ),
          );
          isLoading = false;

          update(["home_page"]);
        }
      }
    } catch (e, stackTrace) {
      log("error in getHomePage api call \n $e ", stackTrace: stackTrace);
    }
  }

  // getting trending data api call
  Future getTrending() async {
    isLoading = true;
    String url =
        "https://api.giphy.com/v1/gifs/trending?api_key=$api_key&limit=100&offset=0&rating=g&bundle=messaging_non_clips";

    try {
      final response = await ApiServices().getApiCall(apiUrl: url);

      if (response != null) {
        // log(response.toString());

        final jsonMap = json.decode(response);

        trendingDataModel = List<TrendingDataModel>.from(
          jsonMap["data"].map(
            (x) => TrendingDataModel.fromMap(x),
          ),
        );
        searchModel = trendingDataModel;
        isLoading = false;

        update(["trending_page"]);
      }
    } catch (e, stackTrace) {
      log("error in getHomePage api call \n $e ", stackTrace: stackTrace);
    }
  }

// searching for the keyword
  searchTrending({required String keyword}) async {
    log(trendingDataModel.length.toString());

    if (keyword.isNotEmpty) {
      searchModel = trendingDataModel
          .where((element) => element.title!.contains(keyword))
          .toList();
    } else {
      searchModel = trendingDataModel;
    }
    update(["trending_page"]);
  }

  @override
  void onInit() {
    super.onInit();

    getHomePage();
  }
}
