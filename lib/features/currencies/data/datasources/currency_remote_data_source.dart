import 'dart:convert';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final http.Client client;

  CurrencyRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts/"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<CurrencyModel> currencyModels = decodedJson
          .map<CurrencyModel>((jsonCurrencyModel) => CurrencyModel.fromJson(jsonCurrencyModel))
          .toList();

      return currencyModels;
    } else {
      throw ServerException();
    }
  }


}
