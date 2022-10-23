import 'api_keys.dart';

class EndPoints {
  static const _BASE_URL = 'https://free.currconv.com';
  static const _CURRENCIES =
      '/api/v7/currencies?apiKey=${ApiKeys.CURRENCY_CONVERTER}';
  static const _HOSTORICAL_DATA =
      '/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&date=[yyyy-mm-dd]&endDate=[yyyy-mm-dd]&apiKey=${ApiKeys.CURRENCY_CONVERTER}';
}
