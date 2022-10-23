import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/currency.dart';
import '../repositories/currencies_repository.dart';

class GetHistoricalCurrenciesUseCase {
  final CurrenciesRepository repository;

  GetHistoricalCurrenciesUseCase(this.repository);

  Future<Either<Failure, List<Currency>>> call() async {
    return await repository.getHistoricalCurrencies();
  }
}