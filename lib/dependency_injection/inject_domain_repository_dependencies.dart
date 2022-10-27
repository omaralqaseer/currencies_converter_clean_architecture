import '../features/currencies/data/repositories/currency_repository_impl.dart';
import '../features/currencies/domain/repositories/currencies_repository.dart';
import 'injection_container.dart';

Future<void> initializeDomainRepositoryDependencies() async {
  sl.registerLazySingleton<CurrenciesRepository>(() => CurrenciesRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));
}