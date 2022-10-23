import '../entities/currency.dart';
import '../repositories/currencies_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetAllCurrenciesUseCase {
  final CurrenciesRepository repository;

  GetAllCurrenciesUseCase(this.repository);

  Future<Either<Failure, List<Currency>>> call() async {
    return await repository.getAllCurrencies();
  }
}
