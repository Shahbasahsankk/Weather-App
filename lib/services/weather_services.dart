import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:weather_app/constants/api_endpoints.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/exceptions.dart';

class WeatherService {
  Future<WeatherData> getData() async {
    const location = 'Kohinoor';
    var url = Uri.parse('$kBaseUrl$location&appid=$apiKey&units=metric');

    try {
      var response = await http.get(url).timeout(const Duration(seconds: 20));
      log(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var json = jsonDecode(response.body);
        var jsonAsBody = WeatherData.fromJson(json);
        return jsonAsBody;
      } else {
         throw Exception('Error Occured');
      }
    } on SocketException {
      throw NoNetworkException(message: 'Connection Failed');
    } on HttpException {
      throw NoServiceException(message: 'No Service Found');
    } on TimeoutException {
      throw ConnectionTimeOutException(message: 'Connection Timeout');
    }  catch (e) {
       var response = await http.get(url).timeout(const Duration(seconds: 20));
      throw handleError(response);
    }
  }

  dynamic handleError(http.Response response){
    switch (response.statusCode) {
      case 400:
          throw BadRequestException(message: 'Server Bad Request');
      case 401:
      throw UnAuthorizedException(message: 'Invalid');
      case 403:
          throw UnAuthorizedException(message: 'Invalid Server Address');
      case 500:     
      default:
          throw FetchDataException(message: 'Error Occured While Connecting To Server With StatusCode:${response.statusCode}');
    }
  }
}
