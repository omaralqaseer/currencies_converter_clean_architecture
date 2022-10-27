import '../features/currencies/data/database/db.dart';
import 'injection_container.dart';
import 'package:http/http.dart' as http;

Future<void> initializeExternalDependencies() async {
  sl.registerLazySingleton(() => CurrenciesDatabaseHelper.instance);
  sl.registerLazySingleton(() => http.Client());
}
