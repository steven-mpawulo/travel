import 'dart:convert';
import 'package:http/http.dart' as http;

class TravelService {
  final url = Uri.parse("https://travelbriefing.org/countries.json");
  Future fetchCountries() async {
    try {
      dynamic response = await http.get(url);
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future fetchCountry(recievedUrl) async {
    final countryUrl = Uri.parse(recievedUrl);
    try {
      dynamic response = await http.get(countryUrl);
      Map data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
