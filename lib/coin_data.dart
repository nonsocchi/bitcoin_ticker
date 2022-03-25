import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String apiKey = 'F9CF531B-FE64-451F-84DE-1AFD0419E61B';
const String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String URL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double coinPrice = decodedData['rate'];
      return coinPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
