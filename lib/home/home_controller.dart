import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:t01_value_notifier/home/home_model.dart';
import 'package:t01_value_notifier/home/home_state.dart';

class HomeController {
  final ValueNotifier<HomeState> homeState = ValueNotifier(HomeInitialState());
  final dio = Dio();

  Future<void> getCats() async {
    homeState.value = HomeLoadingState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final response =
          await dio.get('https://api.thecatapi.com/v1/images/search');
      final responseList = response.data as List;
      final homeModel = HomeModel.fromMap(responseList.first);
      homeState.value = HomeSuccessState(homeModel);
    } catch (e) {
      homeState.value = HomeErrorState(e.toString());
    }
  }

  void dispose() {
    homeState.dispose();
  }
}
