import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
Widget addditionalInfirmation(
    String wind, String humidity, String pressure, String feelLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wind Speed:  $wind', style: titleFont),
              const SizedBox(
                height: 18,
              ),
              Text('Humidity:  $humidity', style: titleFont),
              const SizedBox(
                height: 18,
              ),
               Text('Pressure:  $pressure', style: titleFont),
               const SizedBox(
                height: 18,
              ),
                Text('FeelsLike:  $feelLike', style: titleFont),
                const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
