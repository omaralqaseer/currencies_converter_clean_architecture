import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../database/db.dart';
import '../models/currency_model.dart';

abstract class CurrencyLocalDataSource {
  Future<List<CurrencyModel>> getCachedCurrencies();

  Future<Unit> cacheCurrencies(List<CurrencyModel> currencyModels);
}

const cachedCurrencies = "cached_currencies";

class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final CurrenciesDatabaseHelper currenciesDatabaseHelper;

  CurrencyLocalDataSourceImpl({required this.currenciesDatabaseHelper});

  @override
  Future<Unit> cacheCurrencies(List<CurrencyModel> currencyModels){
    for (CurrencyModel currencyModel in currencyModels) {
      currenciesDatabaseHelper.createCurrency(currencyModel.toJson());
    }
     return Future.value(unit);
  }

  @override
  Future<List<CurrencyModel>> getCachedCurrencies() async {
    final jsonCurrencies = await currenciesDatabaseHelper.readCurrenciesJson();
    if (jsonCurrencies.isNotEmpty) {
      return jsonCurrencies
          .map((json) => CurrencyModel.fromJson(json))
          .toList();
    } else {
      throw EmptyCacheException();
    }
  }
}
