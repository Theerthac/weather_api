import 'package:flutter/material.dart';


class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  getCurrentWeather(){}

  void changeValue() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
