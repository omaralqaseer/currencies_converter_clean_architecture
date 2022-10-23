import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/currency.dart';

abstract class CurrenciesRepository {
  Future<Either<Failure, List<Currency>>> getAllCurrencies();
  Future<Either<Failure, List<Currency>>> getHistoricalCurrencies();
}
