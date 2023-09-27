import 'package:flutter/cupertino.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/enum/result_state.dart';

import '../data/model/detail_restaurant_model.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String restaurantId;

  DetailRestaurantProvider(
      {required this.apiService, required this.restaurantId}) {
    fetchDataDetailRestaurant(restaurantId);
  }

  late DetailRestaurantModel _detailRestaurantModel;
  late ResultState _resultState;
  String _message = '';

  String get message => _message;

  Future<dynamic> fetchDataDetailRestaurant(String restaurantId) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final detailRestaurant =
          await apiService.getDetailRestaurant(restaurantId);
      _resultState = ResultState.hasData;
      notifyListeners();
      return _detailRestaurantModel = detailRestaurant;
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error get data -> $e';
    }
  }

  Future<dynamic> postReviewRestaurant({
    required String id,
    required String name,
    required String review,
  }) async {
    try {
      final postReviewResult = await apiService.getReviewRestaurant(
          id: id, name: name, review: review);
      if (postReviewResult.error == false &&
          postReviewResult.message == 'success') {
        fetchDataDetailRestaurant(id);
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error get data -> $e';
    }
  }
}
