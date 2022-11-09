import 'package:t01_value_notifier/home/home_model.dart';

abstract class HomeState {}

class HomeInitialState implements HomeState {}

class HomeLoadingState implements HomeState {}

class HomeSuccessState implements HomeState {
  final HomeModel homeModel;
  HomeSuccessState(this.homeModel);
}

class HomeErrorState implements HomeState {
  final String message;
  HomeErrorState(this.message);
}
