import 'package:flutter/material.dart';

Widget currentWeather(IconData icon,String temp, String location) {
  return Center(
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(
      icon,
      color: Colors.orange,
      size: 67.0,
    ),
    const SizedBox(height: 10.0,),
    Text(
      "$temp",
      style: const TextStyle(
        fontSize: 44.0,
      ),
    ),
     const SizedBox(height: 10.0,),
     Text(
      "$location",
      style: const TextStyle(
        fontSize: 20.0,
        color: Color.fromARGB(255, 54, 54, 54),
      ),
      )

    ],
   ),
  );
}
