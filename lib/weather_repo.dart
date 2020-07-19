import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:weather_app/weathermodel.dart';

class WeatherRepo {
  Future<WeatherModel> getWWeather(String city) async {
    final result = await http.Client().get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=3979ca2d3fbc1b1087473108d170ff07");
    print(result);
    if (result.statusCode != 200) {
      throw Exception();
    }
    return prasedjson(result.body);
  }

  WeatherModel prasedjson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);
  }
}
