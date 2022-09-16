class WeatherData {
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final Sys sys;
  final String name;

  WeatherData({
    required this.weather,
    required this.main,
    required this.wind,
    required this.sys,
    required this.name,
  });
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      weather:
          (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      sys: Sys.fromJson(json['sys']),
      name: json['name']
    );
  }
}

class Weather {
  final String description;

  Weather({required this.description});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(description: json['description']);
  }
}

class Main {
  final num temp;
  final num feelsLike;
  final num pressure;
  final num humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Wind {
  final num speed;

  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}

class Sys {
  final String country;

  Sys({required this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(country: json['country']);
  }
}
