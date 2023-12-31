import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/weather_provider.dart';
import 'package:weather/view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => WeatherProvider(),
      child:  const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
