import '../services/networking.dart';
import '../services/location.dart';
import 'networking.dart';

const apiKey = 'a5070153b4a627817b607935eb46e3e9';
const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    LocationEngine loc = LocationEngine();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$apiUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=imperial');

    var decodedData = await networkHelper.getData();

    return decodedData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$apiUrl?q=$cityName&appid=$apiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var decodedData = await networkHelper.getData();

    return decodedData;
  }
}
