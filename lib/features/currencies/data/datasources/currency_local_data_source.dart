import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../models/currency_model.dart';

abstract class CurrencyLocalDataSource {
  Future<List<CurrencyModel>> getCachedCurrencies();
  Future<Unit> cacheCurrencies(List<CurrencyModel> currencyModels);
}

const cachedCurrencies = "cached_currencies";

class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final SharedPreferences sharedPreferences;

  CurrencyLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCurrencies(List<CurrencyModel> currencyModels) {
    List currencyModelsToJson = currencyModels
        .map<Map<String, dynamic>>((currencyModel) => currencyModel.toJson())
        .toList();
    sharedPreferences.setString(cachedCurrencies, json.encode(currencyModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<CurrencyModel>> getCachedCurrencies() {
    final jsonString = sharedPreferences.getString(cachedCurrencies);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<CurrencyModel> jsonToCurrencyModels = decodeJsonData
          .map<CurrencyModel>((jsonCurrencyModel) => CurrencyModel.fromJson(jsonCurrencyModel))
          .toList();
      return Future.value(jsonToCurrencyModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
