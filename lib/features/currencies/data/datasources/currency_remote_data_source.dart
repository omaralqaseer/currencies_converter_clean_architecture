import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/api_keys.dart';
import '../../../../core/network/end_points.dart';
import '../models/currency_model.dart';
import '../models/historical_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();

  Future<List<HistoricalModel>> getHistoricalCurrencies();
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
      final jsonBody = json.decode(response.body);
      var list = jsonBody["results"];
      List<String> currenciesKeys = (list.keys).toList();
      List<CurrencyModel> currencyModels = [];
      for (String c in currenciesKeys) {
        currencyModels.add(CurrencyModel.fromJson(list[c]));
      }
      return currencyModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<HistoricalModel>> getHistoricalCurrencies() async {
    DateTime now = DateTime.now();
    DateTime beforeWeek = now.subtract(const Duration(days: 7));
    String startDate =
        "${beforeWeek.year}-${beforeWeek.month}-${beforeWeek.day}";
    String endDate = "${now.year}-${now.month}-${now.day}";
    String fromCurrency = "USD";
    String toCurrency = "EUR";
    String convert = "${fromCurrency}_$toCurrency";
    final response = await client.get(
      Uri.parse(EndPoints.BASE_URL +
          "/convert?q=$convert&compact=ultra&date=$startDate&endDate=$endDate&apiKey=${ApiKeys.CURRENCY_CONVERTER}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      final keyList = responseBody[convert] as Map;
      final historicalModels = keyList.keys
          .map((key) => HistoricalModel(
                fromCurrency: fromCurrency,
                toCurrency: toCurrency,
                date: key,
                value: keyList[key],
              ))
          .toList();
      return historicalModels;
    } else {
      debugPrint(
          'status is ${response.statusCode}  error is ${jsonDecode(response.body)['error']} ');
      throw ServerException();
    }
  }
}
