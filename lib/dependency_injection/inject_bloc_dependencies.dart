import '../features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'injection_container.dart';

Future<void> initializeBlocDependencies() async {
  sl.registerFactory(() =>
      CurrenciesBloc(getAllCurrencies: sl(), getHistoricalCurrencies: sl()));
}