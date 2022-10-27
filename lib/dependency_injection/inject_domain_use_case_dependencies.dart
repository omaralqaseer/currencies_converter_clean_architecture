import '../features/currencies/domain/usecases/get_all_currencies.dart';
import '../features/currencies/domain/usecases/get_historical_currencies.dart';
import 'injection_container.dart';

Future<void> initializeDomainUseCaseDependencies() async {
  sl.registerLazySingleton(() => GetAllCurrenciesUseCase(sl()));
  sl.registerLazySingleton(() => GetHistoricalCurrenciesUseCase(sl()));
}