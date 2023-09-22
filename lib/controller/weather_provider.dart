// import 'package:flutter/material.dart';

// import '../model/weather_model.dart';
// import '../service/weather_api_client.dart';

// class WeatherProvider extends ChangeNotifier {

//   TextEditingController searchController = TextEditingController();

//   bool isLoading = false;
//   Weather? data;

//   String get place => place;

//   getCurrentWeather() {}

//   void changeValue() {
//     isLoading = !isLoading;
//     notifyListeners();
//   }

//   void getData(String s) async {
//     data = await WeatherService().getData(place);
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../service/weather_api_client.dart';

class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  Weather? data;

  Future<Weather?> getData(String place) async {
    data = await WeatherService().getData(place);

    notifyListeners();

    return data;
  }

  void changeValue() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
