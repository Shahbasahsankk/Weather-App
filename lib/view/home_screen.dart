import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/exceptions.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/view/widgets/additional_infirmation.dart';
import 'package:weather_app/view/widgets/current_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherService().getData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf9f9f9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFf9f9f9),
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder(
          future: WeatherService().getData(),
          builder: (BuildContext context, AsyncSnapshot<WeatherData> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return errorHandle(snapshot.error);
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(
                    Icons.wb_sunny_rounded,
                    snapshot.data!.main.temp.round().toString(),
                    '${snapshot.data!.name}, ${snapshot.data!.sys.country}',
                    snapshot.data!.weather[0].description,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  addditionalInfirmation(
                    snapshot.data!.wind.speed.toString(),
                    snapshot.data!.main.humidity.toString(),
                    snapshot.data!.main.pressure.toString(),
                    snapshot.data!.main.feelsLike.toString(),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text('Server is down, please try again Later'),
              );
            } else {
              return const Center(
                child: Text('Something Error'),
              );
            }
          },
        ),
      ),
    );
  }

  errorHandle(error) {
    if (error is NoNetworkException) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.message),
            IconButton(
              onPressed: () async {
                await WeatherService().getData();
                 setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ],
        ),
      );
    } else if (error is NoServiceException) {
      return Center(
        child: Text(error.message),
      );
    }
    if (error is ConnectionTimeOutException) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.message),
            IconButton(
              onPressed: () async {
                await WeatherService().getData();
                 setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ],
        ),
      );
    } else if (error is BadRequestException) {
      return Center(
        child: Text(error.message),
      );
    } else if (error is UnAuthorizedException) {
      return Center(
        child: Text(error.message),
      );
    } else if (error is FetchDataException) {
      return Center(
        child: Text(error.message),
      );
    } else {
      return Center(
        child: Text(
          error.toString(),
        ),
      );
    }
  }
}
