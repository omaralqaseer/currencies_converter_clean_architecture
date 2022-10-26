import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/currency.dart';
import '../entities/historical.dart';

abstract class CurrenciesRepository {
  Future<Either<Failure, List<Currency>>> getAllCurrencies();
  Future<Either<Failure, List<Historical>>> getHistoricalCurrencies();
}
