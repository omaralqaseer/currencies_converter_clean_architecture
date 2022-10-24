import 'package:currencyconverter_clean_arch/features/currencies/data/database/db.dart';
import 'package:currencyconverter_clean_arch/features/currencies/domain/usecases/get_historical_currencies.dart';
import 'features/currencies/data/datasources/currency_local_data_source.dart';
import 'features/currencies/data/datasources/currency_remote_data_source.dart';
import 'features/currencies/data/repositories/currency_repository_impl.dart';
import 'features/currencies/domain/repositories/currencies_repository.dart';
import 'features/currencies/domain/usecases/get_all_currencies.dart';
import 'features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setup() async {
//! Features - Currencies

// Bloc

  sl.registerFactory(() =>
      CurrenciesBloc(getAllCurrencies: sl(), getHistoricalCurrencies: sl()));

// UseCases

  sl.registerLazySingleton(() => GetAllCurrenciesUseCase(sl()));
  sl.registerLazySingleton(() => GetHistoricalCurrenciesUseCase(sl()));

// Repository

  sl.registerLazySingleton<CurrenciesRepository>(() => CurrenciesRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ));
//networkInfo: sl()
// DataSources

  sl.registerLazySingleton<CurrencyRemoteDataSource>(
      () => CurrencyRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CurrencyLocalDataSource>(
      () => CurrencyLocalDataSourceImpl(currenciesDatabaseHelper: sl()));

//! Core

//! External
  sl.registerLazySingleton(() => CurrenciesDatabaseHelper.instance);
  sl.registerLazySingleton(() => http.Client());
}
