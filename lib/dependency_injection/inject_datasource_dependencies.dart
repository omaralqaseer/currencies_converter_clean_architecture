import '../features/currencies/data/datasources/currency_local_data_source.dart';
import '../features/currencies/data/datasources/currency_remote_data_source.dart';
import 'injection_container.dart';

Future<void> initializeDatasourceDependencies() async {
  sl.registerLazySingleton<CurrencyRemoteDataSource>(
          () => CurrencyRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CurrencyLocalDataSource>(
          () => CurrencyLocalDataSourceImpl(currenciesDatabaseHelper: sl()));
}