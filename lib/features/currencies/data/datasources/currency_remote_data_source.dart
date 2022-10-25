import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/api_keys.dart';
import '../../../../core/network/end_points.dart';
import '../models/currency_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();

  Future<List<CurrencyModel>> getHistoricalCurrencies();
}


class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final http.Client client;

  CurrencyRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await client.get(
      Uri.parse(EndPoints.BASE_URL +
          "/currencies?apiKey=${ApiKeys.CURRENCY_CONVERTER}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final  jsonBody = json.decode(response.body) ;
      var list = jsonBody["results"];
      List<String> currenciesKeys = (list.keys).toList();
      List<CurrencyModel> currencyModels = [];
      for (String c in currenciesKeys) {
        currencyModels.add(CurrencyModel.fromJson(list[c]));
      }
      // debugPrint('currencies is $currencyModels');
      return currencyModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CurrencyModel>> getHistoricalCurrencies() async {
    DateTime now = DateTime.now();
    DateTime beforeWeek = now.subtract(const Duration(days: 7));
    final response = await client.get(
      Uri.parse(EndPoints.BASE_URL +
          "/convert?q=USD_PHP,PHP_USD&compact=ultra&date=${beforeWeek.year}-${beforeWeek.month}-${beforeWeek.day}&endDate=${beforeWeek.year}-${beforeWeek.month}-${beforeWeek.day}&apiKey=${ApiKeys.CURRENCY_CONVERTER}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<CurrencyModel> currencyModels = decodedJson
          .map<CurrencyModel>(
              (jsonCurrencyModel) => CurrencyModel.fromJson(jsonCurrencyModel))
          .toList();
      return currencyModels;
    } else {
      debugPrint('status is ${response.statusCode}  body is ${jsonDecode(response.body)['error']} ');
      response.body;
      throw ServerException();
    }
  }
}
