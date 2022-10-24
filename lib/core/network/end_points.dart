import 'api_keys.dart';

class EndPoints {
  static const BASE_URL = 'https://free.currconv.com/api/v7';
  static const _CURRENCIES =
      '/currencies?apiKey=${ApiKeys.CURRENCY_CONVERTER}';
  static const _HOSTORICAL_DATA =
      '/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&date=[yyyy-mm-dd]&endDate=[yyyy-mm-dd]&apiKey=${ApiKeys.CURRENCY_CONVERTER}';
}
