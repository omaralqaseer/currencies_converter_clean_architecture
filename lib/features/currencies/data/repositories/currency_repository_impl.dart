import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/currency.dart';
import '../../domain/entities/historical.dart';
import '../../domain/repositories/currencies_repository.dart';
import '../datasources/currency_local_data_source.dart';
import '../datasources/currency_remote_data_source.dart';
import '../models/currency_model.dart';

class CurrenciesRepositoryImpl implements CurrenciesRepository {
  final CurrencyRemoteDataSource remoteDataSource;
  final CurrencyLocalDataSource localDataSource;

  CurrenciesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Currency>>> getAllCurrencies() async {
    try {
      final localCurrencies = await localDataSource.getCachedCurrencies();
      return Right(localCurrencies);
    } on EmptyCacheException {
      try {
        final List<CurrencyModel> remoteCurrencies =
            await remoteDataSource.getAllCurrencies();
        await localDataSource.cacheCurrencies(remoteCurrencies);
        return Right(remoteCurrencies);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Historical>>> getHistoricalCurrencies() async {
    try {
      final remoteHistoricalCurrencies =
          await remoteDataSource.getHistoricalCurrencies();
      return Right(remoteHistoricalCurrencies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
